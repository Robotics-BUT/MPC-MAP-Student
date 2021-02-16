close all;
clear;
clc;

disp("Welcome to MPC-MAP Project, GLHF!")

% Setup Environment
environment_setup;

% modifiable variables
start_position = [1, 1]; % (x, y)
agent_motion_vector = [0, 0]; % (vx, vy)

% I. Build map
game_state.map = load_map("resources/map_1.txt");
% game_state.map = load_map("resources/map_2.txt");
game_state.map.discretization_step = 0.2;
game_state.discrete_map = generate_discrete_map(game_state.map);

% II. Initialize agent - DO NOT READ FROM THIS STRUCTURE!
game_state.agent.pose = start_position;
game_state.agent.raycasts = [];
game_state.agent.position_history = [];

% III. Init variables for visualization
game_state.estimated_pose = [0, 0]; % (x,y)
game_state.est_position_history = []; % row = (x,y)
game_state.path = []; % row = (x,y)
game_state.particles = []; % Nx2 matrix, row = (x,y)

% IV. Set given parameters - MUST BE USED FOR THE FINAL SOLUTION!
game_state.params.sensors = [0, 45, 90, 135, 180, 225, 270, 315] / 180 * pi; % (rad)
game_state.params.max_vel = 1; % (m/s)
game_state.params.sampling_period = 0.1; % (s)
game_state.params.max_particles = 1000; % (-)

% V. Init vizualization
figure(1);
hold on;
grid on;
axis equal;
axis([game_state.map.limits(1)-1 game_state.map.limits(3)+1 game_state.map.limits(2)-1 game_state.map.limits(4)+1])
title("Arena");

[cx, cy] = create_circle(game_state.map.goal(1), game_state.map.goal(2), 0.5);
plot(cx, cy, 'Color','red', 'LineWidth',2);
[ax, ay] = create_arrow(game_state.agent.pose(1:2), 0, 0.5);
h = plot(ax, ay, 'Color','blue', 'LineWidth',2);

for i = 1 : size(game_state.map.walls, 1)
    xs = [game_state.map.walls(i,1), game_state.map.walls(i,3)]; 
    ys = [game_state.map.walls(i,2), game_state.map.walls(i,4)];
    line(xs, ys, 'Color','black', 'LineWidth',5);
end

w = waitforbuttonpress;

while true
	
    % 1. Move robot
    game_state.agent.pose = move_agent(game_state.agent.pose, agent_motion_vector);  
    game_state.agent.position_history = [game_state.agent.position_history; game_state.agent.pose];    
    
    % 2. Check if goal has been reached
    if is_in_goal(game_state)
        disp("You WIN! GG!!!")
        break
    end
    
    % 3. Check collision
    if is_in_wall(game_state)
        disp("Game Over. You crashed into a wall. Try it again.");
        break;
    end
    
    % 4. Do measurements
    [game_state.measurement_distances, game_state.agent.raycasts] = perform_measurements(game_state.map, game_state.agent.pose, game_state.params.sensors);
    
    % 5. Estimate current robot position
    game_state.estimated_pose = [0, 0];
    game_state.est_position_history = [game_state.est_position_history; game_state.estimated_pose];
    
    % 6. Plan next motion command
    agent_motion_vector = [0, 0];
    
    % 7. Measure GNSS position - FOR KALMAN ONLY!
    game_state.gnss_pose = gnss_measure(game_state.agent.pose);
    
    % GUI rendering
    h = render_game(game_state, h);
   
end