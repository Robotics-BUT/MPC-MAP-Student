# Week 4 - Particle Filter

The goal of this assignment is to implement a working localization algorithm based on the particle filter. Your submitted solution should be able to demonstrate particle convergence around the robot. 

## Task 1 – Prediction

Implement the prediction function `predict_pose` that takes the particle pose and the control input as arguments and returns the new pose. Apply a probabilistic motion model to enhance particles variance.

## Task 2 – Correction

Implement the measurement function `compute_lidar_measurement` that takes the map, the particle pose, and the lidar orientations as arguments and returns a vector of measured distances **without** any noise.

You may take advantage of the simulator function `ray_cast` which is used as follows:

`intersections = ray_cast(ray_origin, walls, direction)`

The first argument is a position of the ray's initial point, the second argument is the description of walls stored in `read_only_vars.map.walls`, and the final argument is a direction of the ray in radians. The function returns all intersection of the given ray with the walls.

**Tip:** You can use the MoCap pose and lidar measurements to verify that your function returns correct data.

Then, implement the weighting function `weight_particles`. You may use arbitrary metric meeting the requirements.  

## Task 3 – Resampling

Implement the resampling function `resample_particles`, taking a set of particles and their associated weights as arguments and returning a new set of resampled particles. Use any algorithm of your choice.  

## Task 4 – Localization

Initialize a set of particles at random poses within any indoor map. Update the particle filter in each iteration (perform prediction, correction and resampling). Adjust the previously implemented functions to make the particles converge to the robot's true pose. You should be able to present a screenshot with a cluster of particles gathered around the agent. You may need to move the robot in some cases to make the localization work.
 
**Tip:** Begin in a map with distinctive features, i.e. not containing similar corridors etc. You can create your own map to help you with the task. 

Discuss the most important parameters of your solution and justify the selection of algorithms. What was the major issue you have had to overcome?

## Submission

To implement the tasks, use only the `algorithms` directory; do not modify the rest of the simulator. The solution must run without errors in a fresh instance of the simulator and must generate the graphical outputs included in the report.

Create a single A4 report to the provided template that briefly describes your solution, with a few sentences for each task and an image where applicable.

Send the report and a `zip` archive containing the algorithms directory to the lecturer's e-mail by **Wednesday at 23:59 next week**.

For those using Git for version control, you can send a link to your public GitHub repository instead of the `zip` file. The repository must contain the simulator with the `algorithms` directory with your solution. Please tag the final version with `week_4` tag to ensure easy identification.
