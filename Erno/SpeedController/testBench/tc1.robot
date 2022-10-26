*** Settings ***
Documentation    Testing speed limits on car

Library         OperatingSystem
Library         String
Library         Collections
#Library    ../../../../venv2/Lib/site-packages/robot/libraries/String.py
#Resource        ../sub1/sub2/sub3/anyresourcefile

*** Variables ***
# List contains 6 speed limit values
#speed_limits =  [30, 50, 60, 80, 100, 120] 
#car_old_speedlimit = 0
#car_old_speed = 0
#car_${= 0
@{speed_limits}=    ${30}    ${50}    ${60}    ${80}    ${100}    ${120}
${car_old_speedlimit}=   ${0}
${car_old_speed}=    ${0}
${car_current_speed}=    ${0}

*** Keywords ***    
# keyword that sets the speed limit randomly to one of the values from the speed limits table
# parameter: list of speed limits
Set_speed_limit
    ${index}    Generate Random String    1     012345
    ${index}=    Convert To Integer    ${index}
    Log    speedlimits is ${speed_limits}[${index}]
    ${speed_limit}    Set Variable         ${speed_limits}[${index}]
    [Return]     ${speed_limit}
    
# keyword that calls the speed limit setting function and returns the speed limit
# 
Return_speed_limit
    ${generated_speed_limit}    Set_speed_limit
    [Return]     ${generated_speed_limit}

# keyword for setting the value of the old speed limit
Set_old_speed_limit
    [Arguments]    ${oldspeedlimit}
    ${car_old_speedlimit}    Set Variable     ${oldspeedlimit}

# keyword for getting the old speed limit
Return_car_old_speedlimit
    [Return]    ${car_old_speedlimit}

# Keyword for setting the value of the car old speed
Set_car_old_speed
    [Arguments]    ${oldspeed}
    ${car_old_speed}    Set Variable     ${oldspeed}

# keyword for getting the car old speed
Return_car_old_speed
    [Return]     ${car_old_speed}

# keyword for setting the value of the car's current speed
Set_car_current_speed
    [Arguments]    ${newspeed}
    ${car_current_speed}    Set Variable     ${newspeed}

# function for getting the car's current speed
Return_car_current_speed
    [Return]     ${car_current_speed}

# keyword for simulating a car
Simulate_car
    [Arguments]    ${speed_limit_changes}
    # to be done some sensible thing here as loop
    #
    FOR    ${i}    IN    999999
           Exit For Loop If    ${i} == ${speed_limit_changes}
                ${new_speed_limit}     Return_speed_limit
                ${old_speed_limit}     Return_car_old_speedlimit
                ${old_speed}           Return_car_old_speed
                ${current_speed}       Return_car_current_speed
                IF     ${current_speed} == ${0}
                    log    Starting to drive.
                    ${current_speed}    Set Variable     ${new_speed_limit}
                    Set_car_current_speed    ${current_speed}
                ELSE
                    Set_car_current_speed    ${new_speed_limit}
                    log    Cruising at "${current_speed}" km/h.
                END

                log    Speed limit changes.
                
                IF     ${old_speed_limit} > ${0}
                    log    Old speed limit was 
                    log    ${old_speed_limit}
                END

                log    New speed limit is ${new_speed_limit} km/h.
                
                IF     ${old_speed_limit} < ${new_speed_limit}
                    log    Increasing car speed by to match the speed limit.
                ELSE IF     ${old_speed_limit} > ${new_speed_limit}
                    log    Slowing down to match the speed limit.
                ELSE
                    log    Speed limit stayed the same, continuing with the same speed.
                END

                ${new_speed}    Set Variable     ${new_speed_limit}
                
                IF     ${old_speed} == ${0}
                    log    Now cruising at ${new_speed} km/h.
                END

                Set_old_speed_limit    ${new_speed_limit}
                Set_car_old_speed      ${new_speed}
    END



*** Test Cases ***

Test for setting speedlimits for a car
    FOR     ${i}    IN RANGE    999999
            Exit For Loop If    ${i} == 9 
            Simulate_car    ${5}
    END


