# Week 2 - Uncertainty

The goal of this assignment is to become familiar with the simulator and explore uncertainties in the sensors and motion.

## Task 1 – The simulator

Download the repository containig the simulator from GitHub [https://github.com/Robotics-BUT/MPC-MAP-Student](https://github.com/Robotics-BUT/MPC-MAP-Student), and become familiar with it (see the [Simulator](https://robotics-but.github.io/MPC-MAP-Student/resources/simulator/text.html) section). 
- Explore the `private_vars`, `read_only_vars`, and `public_vars` data structures.
- Become familiar with the sequence of the operations in the infinite simulation loop in `main.m` and `algorithms/student_workspace.m`.
- Load different maps via `algorithms/setup.m` and set different start positions.
- Try various motion commands in `algorithms/motion_control/plan_motion.m` and observe the robot's behaviour.

No output is required in this step.

## Task 2 – Sensor uncertainty

The robot is equipped with an 8-way LiDAR and a GNSS receiver. Determine the standard deviation (*std*) `sigma` for the data from both sensors by placing the robot in a static position (zero velocities) in suitable maps and collecting data for at least 100 simulation periods. Discuss whether the *std* is consistent across individual LiDAR channels and both GNSS axes. Plot histograms of the measurements.

## Task 3 – Covariance matrix

Use the measurements from the previous step and MATLAB's internal `cov` function to assemble the covariance matrix for both sensors. Verify that the resultant matrix is of size 8×8 for the LiDAR and 2×2 for the GNSS. Ensure that the values on the main diagonal are equal to `sigma^2, i.e., `variance=std^2`.

## Task 4 – Normal distribution



Create a function `norm_pdf` to assemble the probability density function (*pdf*) of the normal distribution. The function should accept three arguments: `x` (values at which to evaluate the *pdf*), `mu` (mean), and `sigma` (standard deviation). Utilize this function along with the `sigma` values from Task 2 (e.g., for the *1st* LiDAR channel and the *X* GNSS axis) to generate two *pdf* illustrating the noise characteristics of the robot's sensors, and plot them in a single image (use `mu=0` in both cases).

## Task 5 – Motion uncertainty

Uncertainty exists not only in the measurements (sensor data) but also in the motion. Load the `indoor_1` map and attempt to navigate the robot to the goal location without using sensors. To achieve this, apply an appropriate sequence of motion commands inside the `plan_motion.m` function. Save a screenshot of a successful run and discuss the potential sources of uncertainty in the robot's motion.

## Submission

To implement the tasks, use only the `algorithms` directory; do not modify the rest of the simulator. The solution must run without errors in a fresh instance of the simulator and must generate the graphical outputs included in the report.

Create a single A4 report to the provided template that briefly describes your solution, with a few sentences for each task and an image where applicable.

Send the report and a `zip` archive containing the `algorithms` directory to the lecturer's e-mail by **Wednesday at 23:59 next week**.

For those using Git for version control, you can send a link to your public GitHub repository instead of the `zip` file. The repository must contain the simulator with the `algorithms` directory with your solution. Please tag the final version with `week_2` tag to ensure easy identification.
