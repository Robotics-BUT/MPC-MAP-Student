# Week 6 - Path Planning

The goal of this assignment is to implement a working path planning algorithm. Your submitted solution should be able to plan a path between any starting and goal position (if a solution exists).

## Task 1

Choose and implement an algorithm which finds a path between the starting position of the robot and the goal position in the map. The path must not collide with any wall. Use the occupancy grid stored in the variable `read_only_vars.discrete_map.map`.

## Task 2

Adjust the planning algorithm to keep a clearance from obstacles. You may use any method. The clearance needs to be at least 0.2 m.

## Task 3

Apply a smoothing algorithm to the generated paths. Use the iterative algorithm provided in the lecture or find another viable method. Discuss the effects of the algorithm's parameters.

## Submission

To implement the tasks, use only the `algorithms` directory; do not modify the rest of the simulator. The solution must run without errors in a fresh instance of the simulator and must generate the graphical outputs included in the report.

Create a single A4 report to the provided template that briefly describes your solution, with a few sentences for each task and an image where applicable.

Send the report and a `zip` archive containing the algorithms directory to the lecturer's e-mail by **Wednesday at 23:59 next week**.

For those using Git for version control, you can send a link to your public GitHub repository instead of the `zip` file. The repository must contain the simulator with the `algorithms` directory with your solution. Please tag the final version with `week_6` tag to ensure easy identification.