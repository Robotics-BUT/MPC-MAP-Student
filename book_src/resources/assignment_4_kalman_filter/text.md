# Week 5 - Kalman Filter and EKF

The goal of this assignment is to implement a localization algorithm based on the Extended Kalman Filter and GNSS data.

## Task 1 – Preparation

Load the `outdoor_1` map and manually design a trajectory between the start pose `[2,2,π/2]` and the goal location `[16,2]`.

Examine the uncertainty of the GNSS measurement; i.e. implement an initialization procedure which will determine the initial position (*mean*) and the covariance matrix of the GNSS sensor data. You will need the data within later tasks.


## Task 2 – EKF implementation

As you use a differential wheeled robot, there is a nonlinearity in the state and control transition (nonlinear function *g(x)*); thus, you must employ the EKF for the prediction step. Implement `ekf_predict` function for given drive type.

On the other hand, the KF is appropriate for the correction phase, since there is a linear relation between the state and measurement. Implement `kf_correct` function.

## Task 3 – Filter tuning with a known initial pose

Set the initial pose to `x=[2,2,π/2]`. Use this pose and Σ with zeros (i.e., high certainty) as the initial belief for the EKF algorithm, and navigate the robot along your trajectory to the goal location. Only the EKF-based estimated pose can be utilized for the control. You already know the GNSS covariance matrix to assemble the `Q` matrix (measurement noise covariance); for the process noise, apply variances 0.01 (a rough initial estimate) to all variables and tune the `R` matrix to reach an optimal performance. Capture the result.

## Task 4 – Algorithm deployment

In practice, the true initial pose is not know for the algorithm. Utilize your initialization procedure from the Task 1 to determine the initial belief for the EKF. Notice that you can not measure the robot orientation, therefore a high variance must be specified for this variable within the initial belief.

Observe, how the estimated pose converges to the real pose values, and eventually tune the filter parameters to reach an optimal performance (a "smooth" estimate). Notice the orientation is successfully estimated even it is not directly measured. Capture a successful ride to the goal location.


## Submission

To implement the tasks, use only the `algorithms` directory; do not modify the rest of the simulator. The solution must run without errors in a fresh instance of the simulator and must generate the graphical outputs included in the report.

Create a single A4 report to the provided template that briefly describes your solution, with a few sentences for each task and an image where applicable.

Send the report and a `zip` archive containing the `algorithms` directory to the lecturer's e-mail by **Wednesday at 23:59 next week**.

For those using Git for version control, you can send a link to your public GitHub repository instead of the `zip` file. The repository must contain the simulator with the `algorithms` directory with your solution. Please tag the final version with `week_5` tag to ensure easy identification.

