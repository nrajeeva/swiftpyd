*** Settings ***
Documentation   Sign up or Login session testsuite
Suite Setup     Open Browser to Swift Login Page
Test Setup      Click the Exisiting User
Suite Teardown  Suite Teardown
Test Teardown   //teardown to reset session ID
Force Tags      QA  Smoke   Prod    GUI

*** Test Cases ***
Layout
    [Tags]              P1  Sanity
    [Documentation]     This test verifies the layout of Sign up Page
    Setup Account Layout

Sign up or Login
    [Tags]              P1  Sanity
    [Documentation]     This test verifies the functionality when user enter the phone number
    Valid Login Number  ${phone_number}
    Valid OTP Run

Invalid Sign up or Login
    [Tags]              P1  Sanity
    [Documentation]     This test verifies the functionality when user with invalid phone number
    Invalid Login User  ${phone_number}

OTP TimeOut
    [Tags]              P1  Sanity
    [Documentation]     This test verifies the functionality when user dont enter otp in 22 sec
    Valid Login Number  ${phone_number}
    Sleep               30 sec
    Valid OTP Run
    Wait Until Page Contains Element        //div[contains (@class, 'small text-muted')]//div[contains  (@text, 'By clicking continue you agree to the ')]



