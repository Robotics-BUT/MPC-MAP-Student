# Week 3 - Motion control

This week, implement a simple path-following algorithm using motion capture-based localization data. Your submitted solution should be able to lead the robot to the goal along a defined path.

## Task 1 – Creating maps

Look into examples located in the `maps` folder and try to identify meaning of individual parameters by the means of reverse engineering. If you with to create a custom map to test your algorithms, you need to define a GNSS-denied region to simulate indoor environment where the motion capture works. 

No output is required in this step.

## Task 2 – Create a path

Define a path in `indoor_1` map, leading from point `(2, 8.5)` to the goal position. The path must not consist of straight lines only, incorporate also curves (e. g., a circular arc or a sine wave). Maintain safe distance between path segments and the walls.
 
A path is defined as a sequence of (x, y) waypoints. Note that waypoints stored in the `public_vars.path` variable are visualized by the simulator. Utilization of this variable is recommended. 

## Task 3 – Motion control

Set your robot‘s starting position to match the beginning of the defined path – `(2, 8.5)`. Choose any path-following algorithm and implement it to make the robot follow the path defined in the previous task. Use the variable `read_only_vars.mocap_pose` to get nearly true pose of the robot. Discuss how parameters of the chosen method affect the quality of the motion control.

Put your solution into the `plan_motion` function. By default, the code structure is prepared for target point-based algorithms; you are, however, free to alter the function and use, e.g., the cross track error instead. The choice depends on your preferences, you can even implement multiple algorithms and compare them.
 
Mind the fact that the MoCap data will not be available for the final project!

## Submission
To implement the tasks, use only the `algorithms` directory; do not modify the rest of the simulator. The solution must run without errors in a fresh instance of the simulator and must generate the graphical outputs included in the report.

Create a single A4 report to the provided template that briefly describes your solution, with a few sentences for each task and an image where applicable.

Send the report and a `zip` archive containing the algorithms directory to the lecturer's e-mail by **Wednesday at 23:59 next week**.

For those using Git for version control, you can send a link to your public GitHub repository instead of the `zip` file. The repository must contain the simulator with the `algorithms` directory with your solution. Please tag the final version with `week_3` tag to ensure easy identification.
