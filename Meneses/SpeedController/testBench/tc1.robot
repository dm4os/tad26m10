*** Settings ***
Documentation    Our first test with robot

Library         OperatingSystem
#Resource        ../sub1/sub2/sub3/anyresourcefile

*** Variables ***
@{IamAglobal}
${IamAlocal}

@{mammals}      cat    dog    cow    bull 
# in python the prev list --> mammals = ["cat","dog","cow","bull"]

*** Keywords ***    # Keywords are like functions in python and others
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