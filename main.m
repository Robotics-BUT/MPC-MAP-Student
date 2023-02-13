close all;
clear;
clc;

disp('Welcome to MPC-MAP Project, GLHF!')

% Setup Environment
environment_setup;

% modifiable variables
start_position = [1, 1, pi/2]; % (x, y, theta)
agent_motion_vector = [0, 0]; % (vR, vL)

% I. Build map
read_only_vars.map = load_map("resources/outdoor_1.txt");
read_only_vars.map.discretization_step = 0.2;
read_only_vars.discrete_map = generate_discrete_map(read_only_vars.map);
read_only_vars.map.goal_tolerance = 0.5;

% II. Initialize agent - DO NOT READ FROM PRIVATE_VARS STRUCTURE!
private_vars.agent_pose = start_position;
private_vars.raycasts = [];
private_vars.agent_position_history = [];
read_only_vars.agent_drive.type = 2; % 1 = omnidirectional drive, 2 = differential drive
read_only_vars.agent_drive.interwheel_dist = 0.2; % in case of diff drive
read_only_vars.agent_drive.max_vel = 1;
read_only_vars.measurement_distances = [];
read_only_vars.gnss_pose = [];
public_vars.estimated_pose = [];

% III. Set other given parameters
read_only_vars.sensors = [0, 45, 90, 135, 180, 225, 270, 315] / 180 * pi; % (rad)
read_only_vars.sampling_period = 0.1; % (s)
read_only_vars.max_particles = 1000; % (-)

% IV. Init variables for visualization
public_vars.est_position_history = []; % row = (x,y,theta)
public_vars.path = []; % row = (x,y)
public_vars.particles = []; % Nx3..m matrix, row = (x,y,theta, ...)
public_vars.gnss_history = [];

% V. Init vizualization
figure(1);
hold on;
grid on;
axis equal;
axis([read_only_vars.map.limits(1)-1 read_only_vars.map.limits(3)+1 read_only_vars.map.limits(2)-1 read_only_vars.map.limits(4)+1])
title('MPC-MAP Arena');

[cx, cy] = create_circle(read_only_vars.map.goal(1), read_only_vars.map.goal(2), read_only_vars.map.goal_tolerance);
plot(cx, cy, 'Color','green', 'LineWidth',2);
[ax, ay] = create_arrow(private_vars.agent_pose(1:2), private_vars.agent_pose(3), 0.5);
h = plot(ax, ay, 'Color','blue', 'LineWidth',2);

for i = 1 : size(read_only_vars.map.walls, 1)
    xs = [read_only_vars.map.walls(i,1), read_only_vars.map.walls(i,3)]; 
    ys = [read_only_vars.map.walls(i,2), read_only_vars.map.walls(i,4)];
    line(xs, ys, 'Color','black', 'LineWidth',5);
end
line([read_only_vars.map.limits(1), read_only_vars.map.limits(3)], [read_only_vars.map.limits(2), read_only_vars.map.limits(2)], 'Color','black', 'LineWidth',1, 'LineStyle', '--');
line([read_only_vars.map.limits(3), read_only_vars.map.limits(3)], [read_only_vars.map.limits(2), read_only_vars.map.limits(4)], 'Color','black', 'LineWidth',1, 'LineStyle', '--');
line([read_only_vars.map.limits(1), read_only_vars.map.limits(3)], [read_only_vars.map.limits(4), read_only_vars.map.limits(4)], 'Color','black', 'LineWidth',1, 'LineStyle', '--');
line([read_only_vars.map.limits(1), read_only_vars.map.limits(1)], [read_only_vars.map.limits(2), read_only_vars.map.limits(4)], 'Color','black', 'LineWidth',1, 'LineStyle', '--');
for i=1:size(read_only_vars.map.gnss_denied, 1)
    pgon = polyshape(read_only_vars.map.gnss_denied(i, 1:2:end), read_only_vars.map.gnss_denied(i, 2:2:end));
    plot(pgon, 'FaceColor', 'magenta', 'FaceAlpha', 0.1, 'EdgeColor','magenta', 'LineStyle', '--');
end

clear ax ay cx cy i xs ys pgon start_position;

w = waitforbuttonpress;

while true
	
    % 1. Move robot
    private_vars.agent_pose = move_agent(private_vars.agent_pose, agent_motion_vector, read_only_vars.agent_drive, read_only_vars.sampling_period);  
    private_vars.agent_position_history = [private_vars.agent_position_history; private_vars.agent_pose];    
    
    % 2. Check if goal has been reached
    if is_in_goal(private_vars, read_only_vars)
        disp('You WIN! GG!!!')
        break
    end
    
    % 3. Check collision
    if is_in_wall(private_vars, read_only_vars)
        disp('Game Over. You crashed into a wall. Try it again.');
        break;
    end
    
    % 4. Check presence in the arena
    if is_out(private_vars, read_only_vars)
        disp('Game Over. You left the arena. Try it again.');
        break;
    end
    
    % 5. Check number of particle
    if (size(public_vars.particles,1) > read_only_vars.max_particles)
        disp('Game Over. You exceeded the allowed number of particles')
        break;
    end
    
    % 6. Do measurements
    [read_only_vars.measurement_distances, private_vars.raycasts] = perform_measurements(read_only_vars.map, private_vars.agent_pose, read_only_vars.sensors);
    
    % 7. Measure GNSS position
    read_only_vars.gnss_pose = gnss_measure(private_vars.agent_pose, read_only_vars.map.gnss_denied);
    public_vars.gnss_history = [public_vars.gnss_history; read_only_vars.gnss_pose];
    
    % 8. Estimate current robot position
    public_vars.estimated_pose = [0, 0, 0]; % (x,y,theta)
    public_vars.est_position_history = [public_vars.est_position_history; public_vars.estimated_pose];
    
    % 9. Plan next motion command
    agent_motion_vector = [0.5, 0.5];
    
    % 10. GUI rendering
    h = render_game(private_vars, read_only_vars, public_vars, h);
   
end