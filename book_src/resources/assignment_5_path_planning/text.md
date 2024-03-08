# Week 6 - Path Planning

The goal of this assignment is to implement a working path planning algorithm.

## Task 1

Choose and implement an algorithm which finds a path between the starting position of the robot and the goal position in the map. The path must not collide with any wall. Use the occupancy grid stored in the variable `read_only_vars.discrete_map.map`.

## Task 2

Adjust the planning algorithm to keep a clearance from obstacles. You may use any method. The clearance should be at least 0.3 m.

## Task 3

Apply a smoothing algorithm to the generated paths. Use the iterative algorithm provided in the lecture, or find another. Discuss the effects of the algorithm's parameters.

## Submission

To implement the tasks, use the `algorithm` directory only, do not modify the rest of the simulator. The solution must work in the fresh simulator without any errors, and must generate the graphical outputs contained in the report

Create a single A4 report that will briefly describe your solution (few sentences for each task and an image, if makes sense).

Send the report and `zip` archive comprising the `algorithm` directory to the lecturer's e-mail by Sunday 23:59 of the given week of the semester.