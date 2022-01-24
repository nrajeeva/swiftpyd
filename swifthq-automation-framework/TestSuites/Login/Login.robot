*** Settings ***
Documentation   Welcome session test suite
Suite Setup     Open Browser to Swift Login Page
Suite Teardown  Suite Teardown
Test Teardown   //teardown to reset session ID
Force Tags      QA  Smoke   Prod    GUI

*** Test Cases ***
Layout
    [Tags]              P1  Sanity
    [Documentation]     This test verifies the layout of Welcome Page
    Welcome Page Layout

Create Session
    [Tags]              P1
    [Documentation]     This test verifies create session part
    Click Create Seesion
    //Rest of the functionality as the button seem non reactive

Use Exisiting Session
    [Tags]              P1
    [Documentation]     This test verifies use Exisiting Session
    Click the Exisiting User    sess_mFq2ZmfDZG7cMChrKCvoYw







