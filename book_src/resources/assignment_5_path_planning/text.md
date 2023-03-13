# Week 6 - Path Planning

The goal of this assignment is to implement a working path planning algorithm.

Create a single A4 report that will describe your approach to the exercise (3-6 sentences for each task and a picture, if it makes sense).

## Task 1

Implement the basic A* algorithm which finds a path between the starting position of robot and the goal position in map. The path must not collide with any wall. Use the occupancy grid stored in variable `read_only_vars.discrete_map.map`.

## Task 2

Adjust the planning algorithm to keep clearance from obstacles. You may use any method. The clearance should be at least 0.3 m.

## Task 3

Apply a smoothing algorithm to generated paths. Use the iterative algorithm provided in the lecture. Discuss the effect of the algorithm parameters.

## Submission

Send the report and all related MATLAB scripts to <tomas.lazna@ceitec.vutbr.cz>.
MATLAB script must be executable without any errors and has to generate all graphical outputs that are in the report.
Deadline: 19 March 2023, 23:59.
