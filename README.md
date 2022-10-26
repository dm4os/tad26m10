# Introduction
This repository contains topics discussed during the day with students as well as their individual work

# Plan for 26.10.2022
1. Continue working on the BDD and ATDD task given on the 25.10.2022.
2. Develop 1st RF testbench based on the speed controller exercise.
3. Testing a simulated remote power supply with robotframework  https://riptutorial.com/robotframework/topic/10672/how-robot-framework-is-used-in-automation-testing-in-embedded-systems-

# How to run your robot framework scripts
-> robot <path where your rf files are located/><filename>.robot

To root reports to an specific location you need to  
-> robot -x <path>output.xml -l <path>log.html <path>report.html <path><filename>.robot

---> Example: robot -x Meneses/SpeedController/reports/output_26102022.xml -l Meneses/SpeedController/reports/log_26102022.html -o Meneses/SpeedController/reports/report_26102022.html  Meneses/SpeedController/testBench/tc1.robot