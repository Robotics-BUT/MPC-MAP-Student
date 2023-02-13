# MATLAB Robot Simulator

The simulator is lightweight, MATLAB-based tool for testing key algorithms utilized for navigation in mobile robotics. Basically, it integrates differential drive mobile robot model equipped with two different sensors (LiDAR and GNSS), and  enables to deploy it within custom 2D maps. The main goal is to navigate the robot from start to goal position; for this reason, several algorithms must be implemented:

- **Localization**: two algorithms are needed - for outddor and indoor. The pose may be estimated via Extended Kalman Filter and GNSS data in outdoor areas; for indoor, the algorithm utilizing Particle Filter and known map is more suitable since there is a GNSS denied zone indoor.
- **Path planning**: an algorithm to find optimal, obstacle-free path from the start to goal location (eg. A* and Dijkstra's algorithms).
- **Motion control**: a control strategy to follow the computed path by using the actual estimated pose. This results to the control commands for the individual wheels.

## Variables

The simulator uses numerous variables to provide its function; however, not all of them can be used/red to solve the task (the robot's true position, for example). The variables are divided into three groups (structures):

- **Private variables** (`private_vars`): **do not use** these variables in your code!
- **Read only variables** (`read_only_vars`): these are accessible for your code, but **do not modify** them!
- **Public variables** (`public_vars`): feel free to use and modify these variables.

Except these variable groups, there are multiple other variables in your workspace, but there is no limit to their use. Own variables can of course be added.

## Simulation Loop

The simulator workspace comprise `main.m` script, which contains the main simulator logic/loop and is used to run the simulation (`F5` key). After the initialization part (you can add your own variables there), there is a `while true` infinity simulation loop with the following components:

1. **Move robot**: the `move_agent` function physically moves the robot according the `agent_motion_vector` control variable.
2. **Check goal**: check if goal has been reached.
3. **Check collision**: check whether the robot has not hit the wall.
4. **Check presence**: check whether the robot has not left the arena.
5. **Check particles**: check the particle limit.
6. **LiDAR measurement**: read the LiDAR data using the `perform_measurements` function, save it into `read_only_vars.measurement_distances` variable.
7. **GNSS measurement**: read the GNSS data using the `gnss_measure` function, save it into `read_only_vars.gnss_pose` variable.
8. **Estimate position**: place your **POSE ESTIMATION** algorithm here, and save the result into the `public_vars.estimated_pose` variable.
9. **Path planning**: place your **PATH PLANNING** algorithm here, and save the result into the `public_vars.path` variable.
10. **Plan motion**: place your **MOTION CONTROL** algorithm here, and save the result into the `agent_motion_vector` variable (`[v_right, v_left]`).
11. **GUI rendering**: render the game state in a Figure window.

In general, you should modify the steps 8.-10. only.

## Custom Functions

To preserve code readability, do not place the code of your algorithms directly into the simulation loop; instead, organize it logically into functions, and place them into the `algorithms` directory.

## Maps and testing

The `resources` directory contains several maps in the text file format, which are parsed in real-time when the simulation is started. Use reverse engineering to understand the syntax, and create own maps to test your algorithms thoroughly. In general, the syntax includes the definition of the goal position, map dimensions, wall positions, and GNSS-denied polygons. Do not forget to test various start poses as well (including start angle!); this is adjustable via `start_position` variable. For the project evaluation, a comprehensive map comprising both indoor and outdoor areas and GNSS-denied zones will be employed.

## GUI

<img src="imgs/mpc-map-legend.png" alt="sensor model" width="100%"/>
