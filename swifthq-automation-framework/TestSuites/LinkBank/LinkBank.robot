*** Settings ***
Documentation   Linking the bank account
Suite Setup     Open Browser to Swift Login Page
Test Setup      Sign up or Login
Suite Teardown  Suite Teardown
Test Teardown   //teardown to reset session ID
Force Tags      QA  Smoke   Prod    GUI

*** Test Cases ***
Layout
    [Tags]                  P1  Sanity
    [Documentation]         This test verifies the welcome layout of Link Bank
    Link Bank Account Welcome Layout

Enter the Bank of your choice
    [Tags]                  P1  Sanity
    [Documentation]         Enter the bank of choice and continue
    Search the Bank         Bank of America
    Click the retrived Bank
    Enter the credential    ${user_name}        ${password}

Reset Password
    [Tags]                  P2
    [Documentation]         To validate the behaviour of reset password
    Reset Password          ${acc_number}   ${SSID}
    




