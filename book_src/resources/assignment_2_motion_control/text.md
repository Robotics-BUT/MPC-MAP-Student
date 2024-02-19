# Week 3 - Motion control

This week, implement a simple path-following algorithm using motion capture-based localization data.

Make sure that your simulator version is up-to-date as the older versions do not provide MoCap.

## Task 1 – Creating maps

Look into examples located in the `maps` folder and try to identify meaning of individual parameters by means of the reverse engineering. Then, create an arbitrary custom map containing at least one wall. The map is going to be used to test your motion control algorithm so make it rather spacious. You need to define a GNSS-denied region to simulate indoor environment where the motion capture works. 

## Task 2 – Sample paths

Define at least three test paths of different kind, for example:
- straight line,
- circular arc,
- sine wave.

A path is defined as a sequence of (x, y) waypoints. Note that waypoints stored in the `public_vars.path` variable are visualized by the simulator. Utilization of this variable is recommended. 

## Task 3 – Motion control

Choose any path-following algorithm and implement it to make the robot follow the paths defined in the previous task. Use the variable `read_only_vars.mocap_pose` to get nearly true pose of the robot. Discuss how parameters of the chosen method affect the quality of the motion control.

Put your solution to the `plan_motion` function. By default, the code structure is prepared for target point-based algorithms; you are, however, free to alter the function and use, e.g., the cross track error instead. The choice depends on your preferences, you can even implement multiple algorithms and compare them. 

Mind the fact that the MoCap data will not be available for the final project!

## Submission

To implement the tasks, use the `algorithm` directory only, do not modify the rest of the simulator. The solution must work in the fresh simulator without any errors, and must generate the graphical outputs contained in the report

Create a single A4 report that will briefly describe your solution (few sentences for each task and an image, if makes sense).

Send the report and `zip` archive comprising the `algorithm` directory to the lecturer's e-mail by Sunday 23:59 of the given week of the semester.