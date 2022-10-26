# Introduction
This repository contains topics discussed during the day with students as well as their individual work

# Plan for 26.10.2022
1. Continue working on the BDD and ATDD task given on the 25.10.2022.

    ### An automous car like Tesla.

    * Behavior-driven development [BDD] approach  
    As a "driver"
    I WANT the car to determine the speed limit and set the speed to that limit.
    SO THAT I don't have to adjust the speed myself.

    * Acceptance test-driven development [ATDD] approach 
    GIVEN the speed limit 70km/h
    WHEN the car in moving
    THEN the speed limit should remain/adjusted between 65 and 70km/h

    GIVEN the speed limit 70km/h
    WHEN the speed limit changes to 50km/h
    THEN deceleration rate should be 15km/h

2. Develop 1st RF testbench based on the speed controller exercise.
3. Testing a simulated remote power supply with robotframework  https://riptutorial.com/robotframework/topic/10672/how-robot-framework-is-used-in-automation-testing-in-embedded-systems-

-!- For running the exercise you need to install in your virtual environment (activate it) the following:

-> pip install robotframework-requests
-> pip install flask
-> pip install Flask-HTTPAuth

# How to run your robot framework scripts
-> robot <path where your rf files are located/><filename>.robot

To root reports to an specific location you need to  
-> robot -x <path>output.xml -l <path>log.html <path>report.html <path><filename>.robot

---> Example: robot -x Meneses/SpeedController/reports/output_26102022.xml -l Meneses/SpeedController/reports/log_26102022.html -o Meneses/SpeedController/reports/report_26102022.html  Meneses/SpeedController/testBench/tc1.robot