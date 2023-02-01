# Week 2 - Sensor Modeling

Using MATLAB script, simulate the simple 1D map building process using the simulated measurement and self-proposed Sensor Model.

Create a single A4 report that will describe your approach to the exercise (3-6 sentences for each task and picture, if makes sense).

## Task 1

Define parameters of your simulation
 - Distance of the obstacle x
 - Standard deviation of your sensor σ
 - Discrete map parameters (cell size c and covered area d)

Note: Choose these values with the idea of visualizing your simulation. The visual outputs simulated for parameters of x=100m and σ=0.001m c=0.001m, d=200m will be useless.

## Task 2

In the script file, implement the following functions:

 - The “measure” function will return a single measurement sample with a normal distribution of (μ=obstacle_distance, σ=sensor_std_dev).
 - The “get_positive_sensor_model”; p(z | m_o); function will return gaussian-based obstacle probability distribution function for the entire map space.
 - Complementary implement also the “get_neg_sensor_model”; p(z | m_e).

## Task 3
Create a simulation of the mapping process. Generate 5-10 measurement samples and for each of them generate P(𝑚^o | 𝑧) distribution using the sensor model and update the probability distribution of the obstacles in the map P(𝑚^o).
Document the simulation of the map building process with several images, especially the final state of the map model.

## Notes 

p(z | m_o)_a - positive sensor model (prob. that cell a is occupied, if we measured distance z)

p(z | m_e)_a - negative sensor model (prob. that cell a is empty, if we measured distance z)

p(m_o | z)_a - inverse sensor model (map; probability that cell a is occupied, if we measured distance z) 

<img src="imgs/sm.png" alt="sensor model" width="50%"/>

<img src="imgs/ism.png" alt="inverse sensor model" width="50%"/>

## Submission

Send the report and all related MATLAB scripts at adam.ligocki@vutbr.cz.
MATLAB script must be executable without errors and has to generate all graphical outputs that are in the report.
Deadline: Spring Semester 2023, Week 1, Sunday 23:59.
