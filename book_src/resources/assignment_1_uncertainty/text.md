# Week 2 - Uncertainty

The goal of this assignment is to get familiar with the simulator, and explore uncertainties in the sensors and motion.

## Task 1 – The simulator

Download the simulator from GitHub [https://github.com/Robotics-BUT/MPC-MAP-Student](https://github.com/Robotics-BUT/MPC-MAP-Student), and get familiar with it (see the [Simulator](https://robotics-but.github.io/MPC-MAP-Student/resources/simulator/text.html) section). Focuse your attention on the `private_vars`, `read_only_vars` and `public_vars` data structures, and the sequence of operations in the infinite simulation loop. Try loading different maps and setting various motion commands. No output is required in this step.

## Task 2 – Sensor uncertainty

The robot is equipped with 8-way LiDAR and GNSS receiver. Determine the standard deviation (*std*) `sigma` for the data from both sensors by placing static robot (zero velocities) into suitable maps, and reading the data for at least 100 simulation periods. Discuss whether the *std* is consistent across the individual LiDAR channels, and across both GNSS axes. Plot histograms of the measurements.

## Task 3 – Covariance matrix

Use the measurements from the previous step, and MATLAB internal `cov` function to assemble covariance matrix for both sensors. Verify the resultant matrix is of size 8x8 and 2x2 for the LiDAR and GNSS, respectively. Verify the values on the main diagonal equal to `sigma^2`, i.e. equal to `variance=std^2`.

## Task 4 – Normal distribution

Create a function `norm_pdf` for assembling probability density function (*pdf*) of the normal distribution. The function accepts three arguments: `x` (values at which to evaluate the *pdf*), `mu` (mean), and `sigma` (standard deviation). Utilize this function and `sigma` values from the Task 2 (e.g. for the *1st* LiDAR and *X* GNSS axis) to generate two *pdf*s illustrating the noise characteristics of the robots sensors, and plot it into one image (use `mu=0` in both cases).

## Task 5 – Motion uncertainty

The uncertainty is not just in the measurement (in the sensor data), but in the motion as well. Load the `indoor_1` map and try to navigate the robot to the goal location without using sensors. To do so, apply a proper sequence of motion commands inside the `plan_motion.m` function. Save the screenshot of the successful run and discuss, what could be the potential source of uncertainty in the robot motion.

## Submission

To implement the tasks, use the `algorithm` directory only, do not modify the rest of the simulator. The solution must work in the fresh simulator without any errors, and must generate the graphical outputs contained in the report

Create a single A4 report that will briefly describe your solution (few sentences for each task and an image, if makes sense).

Send the report and `zip` archive comprising the `algorithm` directory to the lecturer's e-mail by Sunday 23:59 of the given week of the semester.
