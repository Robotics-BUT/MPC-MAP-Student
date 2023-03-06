# Week 5 - Kalman Filter and EKF

The goal of this assignment is to implement a working localization algorithm based on the Extended Kalman Filter.

Create a single A4 report that will describe your approach to the exercise (3-6 sentences for each task and picture, if makes sense).

## Task 1

Load the `outdoor_1` map from the resources and manually design a trajectory between the start pose `[2,2,π/2]` and the goal location `[16,2]`.

## Task 2

Examine the noisy positioning data `[x,y]` provided by the `gnss_measure` function, and determine variance for `x` and `y` values. You will employ the measurements and variances for the correction step within the following tasks.

## Task 3

As you use a differential wheeled robot, there is a nonlinearity in the state and control transition (nonlinear function *g(x)*); thus, you must employ the EKF for the prediction step. Implement `ekf_predict` function for given drive type.

On the other hand, the KF is appropriate for the correction phase, since there is a linear relation between the state and measurement. Implement `kf_correct` function.

## Task 4

Use the known initial pose `x=[2,2,π/2]` and Σ with zeros (i.e., high certainty) as the initial belief for the EKF algorithm and navigate the robot along your trajectory to the goal location. Only the KF-based estimated pose can be utilized for the control. You already know the GNSS variances to assemble the `Q` matrix (measurement noise covariance); for the process noise, apply variances 0.01 (a rough initial estimate) to all variables and tune the `R` matrix to reach an optimal performance. Capture the result.

## Task 5

Verify the algorithm behavior with various initial beliefs (remember the start pose will not be known in the project) and observe, how the estimated pose converges to the real pose values. Capture the result.

## Submission

Send the report and `zip` archive comprising your solution at petr.gabrlik@vut.cz.
MATLAB script (`main.m`) must be executable without any errors and has to generate a graphical output illustrating a successful navigation.

Deadline: 12th Mar 2022, 23:59.
