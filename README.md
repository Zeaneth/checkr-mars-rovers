# Checkr Job Application
## Instructions to run the challenge solution:
1. Get this repository's code via your mean of choice. I suggest just running:
    ```shell
    $ git clone git@github.com:Zeaneth/checkr-mars-rovers.git MarsRoversTest_ZamizTobar`
    ```
2. Once the repository is accessible, run the `rovers_team_interface.rb` file from a terminal.
    ```shell
    $ cd MarsRoversTest_ZamizTobar
    $ ruby rovers_team_interface.rb`
    ```
3. You will be prompted to give your test text file path so the script can run it.
    ```shell
    Hello there!
    This script will let you start running the 'Mars Rovers' code challenge
    If you have a test text file of your choice, then write its file_path name on the next line:
    >>
    $ {your_test_file_path.txt}
    ```
4. The mission will start and you'll get the final coordinates of each Rover.
5. If you want to test the code, run the tests added to the repository. You can run the `rovers_team_spec.rb` test file.

### Additional Notes
- This challenge was done and tested with `ruby 3.0.1`. If you're using a Ruby manager like rvm or rbenv, they should set the version for you.
- I agree there should be more tests added to the `rovers_team_spec.rb` test file, but I thought we could go over them if I pass to the next interview.
- This was fun, thanks for the opportunity!
---
## Challenge Instructions
  **The description that follows shows what the challenge given is about. No changes were added to the text, but you might find some markdown emphasis and format which I found better to see.**
## Mars Rovers
### Candidate Instructions
The problem outlined below is generic, with no right, or wrong answer. It is designed to allow candidates to be creative and showcase their programming skills. Unlike phone-based and onsite coding questions, this exercise allows candidates to write code with minimal stress. Your code submission will be leveraged in an onsite interview where you will be challenged to extend your code.

Please:
- Include a brief explanation of your design and assumptions along with your code
- Do not spend more than 3 hours working on this problem
- Ensure that there are instructions to compile and execute your code and tests
- Focus on your backend core logic
- Upload your code and tests to a git repository for sharing

### Introduction to the Problem
There must be a way to supply the application with the input data via text file. The application must run. You should provide sufficient evidence that your solution is complete by, as a minimum, indicating that it works correctly against the supplied test data. Please note that you will be assessed on your judgment as well as your execution.
#### Mars Rovers
A squad of robotic rovers are to be landed by NASA on a plateau on Mars. This plateau, which is curiously rectangular, must be navigated by the rovers so that their on-board cameras can get a complete view of the surrounding terrain to send back to Earth.

A rover's position and location is represented by a combination of x and y coordinates and a letter representing one of the four cardinal compass points. The plateau is divided up into a grid to simplify navigation. An example position might be 0, 0, N, which means the rover is in the bottom left corner and facing North.

In order to control a rover, NASA sends a simple string of letters. The possible letters are 'L', 'R' and 'M'. 'L' and 'R' makes the rover spin 90 degrees left or right respectively, without moving from its current spot. 'M' means move forward one grid point, and maintain the same heading.

Assume that the square directly North from (x, y) is (x, y+1).
### Input
The first line of input is the upper-right coordinates of the plateau, the lower-left coordinates are assumed to be 0,0.

The rest of the input is information pertaining to the rovers that have been deployed. Each rover has two lines of input. The first line gives the rover's position, and the second line is a series of instructions telling the rover how to explore the plateau.

The position is made up of two integers and a letter separated by spaces, corresponding to the x and y coordinates and the rover's orientation.

Each rover will be finished sequentially, which means that the second rover won't start to move until the first one has finished moving.
### Output
The output for each rover should be its final coordinates and heading.

## Input and Output
**Test Input:**
```
5 5
1 2 N
LMLMLMLMM
3 3 E
MMRMMRMRRM
```

**Expected Output:**
```
1 3 N
5 1 E
```
