# Week 4 - Particle Filter

The goal of this assignment is to implement a working localization algorithm based on the particle filter.

Create a single A4 report that will describe your approach to the exercise (3-6 sentences for each task and a picture, if it makes sense).

## Task 1

Implement the prediction function that takes the particle pose and the control input as arguments and returns the new pose. Apply the probabilistic motion model.

## Task 2

Implement the measurement function that takes the map, the particle pose, and the sensor orientations as arguments and return a vector of measured distances without any noise.

You may take advantage of the simulator function `ray_cast` which is used as follows:

`intersections = ray_cast(ray_origin, walls, dir_rad)`

The first argument is position of initial point of a ray, the second argument is the description of walls stored in `read_only_vars.map.walls`, and the final argument is direction of 
the ray in radians. The function returns all intersection of the given ray with the walls.


## Task 3

Initialize a set of particles at random poses within the map. Implement the resampling algorithm and make the particles converge to the actual agent pose via an appropriate weighting 
function (apply the outcomes of the previous task). You should be able to present a screenshot with a cluster of particles gathered around the agent. You may need to move the agent 
to make the particles converge.


## Submission

Send the report and all related MATLAB scripts to <tomas.lazna@ceitec.vutbr.cz>.
MATLAB script must be executable without any errors and has to generate all graphical outputs that are in the report.
Deadline: 5 March 2023, 23:59.
