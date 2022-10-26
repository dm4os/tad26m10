*** Settings ***

Documentation    Rewriting yesterday's exercise in robot?

Library         OperatingSystem

*** Variables ***
@{Speed_Limits}    30    50    60    80    100    120
${Current_Speed}=    ${0}
${Old_Speed}=    ${0}
${Acceleration}=     ${0}

*** Keywords ***
Find_speed_limit
    ${var}=    Set Variable    ${Speed_Limits}
    @{Current_Speed}=    Set Variable    ${var}
    [Return]    ${var}

Find_acceleration
    [Arguments]    ${Current_Speed}    ${Old_Speed}
    [Return]    ${ret}
    IF    ${Current_Speed} == ${Old_Speed}
        ${ret}=    ${0}
    ELSE
        ${ret}=    Evaluate    ${Current_Speed} - ${Old_Speed}
    END

check_each_speed_limit
    FOR    ${var}    IN    ${Speed_Limits}
        Log To Console    ${var}
    END


*** Test Cases ***

Accelerating to 120, going through each speed limit
    [Tags]    Speed test

    FOR    ${var}    IN    @{Speed_Limits}
        
        ${Acceleration}=    Find_acceleration    ${var}    ${Old_Speed}
        Log To Console    ${Acceleration}

        ${Old_Speed}=    Set Variable    ${var}

        Should Be True    ${0} <= ${Acceleration} <= ${30}
    END

