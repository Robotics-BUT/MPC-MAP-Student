# Semester Project

## Project objectives

The primary objective of the semester project is to develop a viable solution for the provided MATLAB simulator. Your code should guide the robot to its goal in the fewest possible iterations. The algorithms should be capable of working across various map types, and accommodate arbitrary goal and starting positions, including orientation. It is imperative that the robot avoids collisions with obstacles and remains within the boundaries of the map. 

Successful completion of the project requires the ability to accomplish the task in all sample maps provided in the `maps` folder. While suitable methods have been covered in lectures and assignments, you are not required to utilize every presented procedure. You are permitted to modify files within the `algorithms` folder and add your own functions; however, altering the `main.m` script is strictly prohibited. **Note that step 7 of the simulator’s main loop will be disabled, rendering MoCap data unavailable.**

## Simulator

The simulator is accessible in the repository <https://github.com/Robotics-BUT/MPC-MAP-Student>. Do not modify any functions relied upon by the simulator; your solution will be evaluated using the functions published in the repository.

**Your code must be executable without dependence on any MATLAB toolbox.**

The solution will be assessed using MATLAB R2023b. **The project must yield no errors upon execution.** 

*Tip:*
Clone a 'clean' copy of the simulator from the repository and utilize a toolbox-free installation of MATLAB to ensure that your project encounters no issues.


## Assessment

The project will undergo testing by the lecturers using various maps and randomly selected coordinates for the start and goal positions (including orientation). The success rate of reaching the goal and the required number of iterations will be statistically evaluated through repeated execution of the code. 

## Submission

Send the `zip` archive comprising the `algorithm` directory to e-mail address <tomas.lazna@ceitec.vutbr.cz> by Wednesday 23:59 of the 9th week of the semester (9 April 2025).

For those using Git for version control, you can send a link to your public GitHub repository instead of the `zip` file. The repository must contain the simulator with the `algorithms` directory with your solution. Please tag the final version with `project` tag to ensure easy identification.

## Scoring system
-	Success rate of reaching the goal: up to 15 points
-	The required number of iterations: up to 15 points
-	Technical quality: up to 20 points

To successfully pass the course, a minimum of 20 points must be obtained from the semester project.