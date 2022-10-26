*** Settings ***
Library     commands.py    #WITH NAME    RPS
#Resource    commands.py

*** Keywords ***
RPS send commands
    [Arguments]    ${command}    ${port}    ${state}
    ${output}=    Send_cmds    ${command}  ${port}  ${state}    #modules=RPS
    [return]    ${output}

RPS get Power
    [Arguments]    ${command}
    ${output}=    Send_cmds    ${command}
    [return]    ${output}

*** Test Cases ***
Turn on Power supply 1 remotely
     ${out}=    RPS send commands     SetPower  0  1
     Should be equal    ${out}  ${True}

Verify power supply 1 is on
    ${out}=     RPS get power    GetPower
    should contain    ${out}  P60=1

Turn off Power supply 1 remotely
     ${out}=    RPS send commands     SetPower  0  0
     Should be equal    ${out}  ${True}

Verify power supply 1 is off
    ${out}=     RPS get power    GetPower
    should contain    ${out}  P60=0