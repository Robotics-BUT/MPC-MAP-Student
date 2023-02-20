# Week 3 - Motion Control

Get acquainted with the simulator utilized for the semestral project and implement a simple path-following algorithm.

Create a single A4 report that will describe your approach to the exercise (3-6 sentences for each task and a picture, if it makes sense).

## Task 1

Download the simulator from Github: <https://github.com/Robotics-BUT/MPC-MAP-Student>

Create a new map consisting of 4 outer walls and a single inner wall at arbitrary position. Look into example maps located in the ‚resources‘ folder and try to identify meaning of individual parameters by means of the reverse engineering.

## Task 2

Define three test trajectories of different kind, for example:
- straight line,
- circular arc,
- sine wave.

A trajectory is defined as a sequence of (x, y) waypoints. Note that the trajectory stored in the `public_vars.path` variable is visualized by the simulator.

## Task 3

Choose arbitrary path-following algorithm and implement it to make the robot follow a straight line. Use the variable `private_vars.agent_pose` to get the true pose of the robot. Discuss how parameters of the chosen method affect the quality of the robot control.

## Submission

Send the report and all related MATLAB scripts to <tomas.lazna@ceitec.vutbr.cz>.
MATLAB script must be executable without any errors and has to generate all graphical outputs that are in the report.
Deadline: 26 February 2023, 23:59.



