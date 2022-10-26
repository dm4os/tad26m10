*** Settings ***
Documentation    Our first test with robot

Library         OperatingSystem
#Resource        anyresourcefile

*** Variables ***
@{IamAglobal}
${IamAlocal}

*** Keywords ***
I_am_a_KW_RET_some_text
    ${var}=     Set Variable    Test automation with robot framework
    [Return]    ${var}

*** Test Cases ***
I am a test case validating the only existing keyword
    #${ret}=    Set Variable    I_am_a_KW_RET_some_text
    ${ret}=   I_am_a_KW_RET_some_text
    Should be equal    ${ret}    Test automation with robot framework