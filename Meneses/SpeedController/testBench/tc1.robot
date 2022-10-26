*** Settings ***
Documentation    Our first test with robot

Library         OperatingSystem
#Resource        anyresourcefile

*** Variables ***
@{IamAglobal}
${IamAlocal}

*** Keywords ***
I_am_a_KW_RET_defined_text
    ${var}=     Set Variable    Test automation with robot framework
    [Return]    ${var}

I_am_a_KW_RET_some_text
    [Arguments]    ${i_text}
    ${var}=     Set Variable    ${i_text}
    [Return]    ${var}

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