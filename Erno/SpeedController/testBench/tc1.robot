*** Settings ***
Documentation    Our first test with robot

Library         OperatingSystem
Library         String
Library         Collections
#Library    ../../../../venv2/Lib/site-packages/robot/libraries/String.py
#Resource        ../sub1/sub2/sub3/anyresourcefile

*** Variables ***
@{IamAglobal}
${IamAlocal}

@{mammals}      cat    dog    cow    bull 
# in python the prev list --> mammals = ["cat","dog","cow","bull"]
# List contains 6 speed limit values
#speed_limits =  [30, 50, 60, 80, 100, 120] 
#car_old_speedlimit = 0
#car_old_speed = 0
#car_current_speed = 0
@{speed_limits}=    30    50    60    80    100    120
@{car_old_speedlimit}=    0
@{car_old_speed}=    0
@{car_current_speed}=    0

*** Keywords ***    # Keywords are like functions in python and others
# keyword that sets the speed limit randomly to one of the values from the speed limits table
# parameter: list of speed limits
Set_speed_limit
    [Arguments]    ${speed_limit_table}
    ${index}=    Generate Random String    1 012345
    ${speed_limit}=    Get from list    ${speed_limit_table}    ${index}
    [Return]     ${speed_limit}
    
# keyword that calls the speed limit setting function and returns the speed limit
# 
Return_speed_limit
    ${generated_speed_limit}=    Set_speed_limit    @{speed_limits}
    [Return]     ${generated_speed_limit}




I_am_a_KW_RET_defined_text
    ${var}=     Set Variable    Test automation with robot framework
    [Return]    ${var}

I_am_a_KW_RET_some_text
    [Arguments]    ${i_text}
    ${var}=     Set Variable    ${i_text}
    [Return]    ${var}

check_for_loop
    FOR   ${var}    IN    @{mammals}
        Log To Console    ${var}
    END

*** Test Cases ***
I am a test case validating KW 1
    [tags]    Smoke test
    #${ret}=    Set Variable    I_am_a_KW_RET_some_text
    ${ret}=   I_am_a_KW_RET_defined_text
    Should be equal    ${ret}    Test automation with robot framework

I am a test case validating KW 2
    [tags]    Integration test
    ${mustBe}=    Set Variable    anything
    ${ret}=   I_am_a_KW_RET_some_text    ${mustBe}
    Should be equal    ${ret}    ${mustBe}

Test our for loop
    [tags]    Smoke test
    check_for_loop
    Should be true    1+1==2