*** Settings ***
Documentation    Suite for all the Link Bank keywords

*** Keywords ***
Link Bank Account Welcome Layout
    [Documentation]                         Validate the functionality of the Link Bank Page
    #Header part of the window
    Wait Until Page Contains Element        //div[2]//h2[contains(text(),'Connect effortlessly')]
    #The phone box available
    Wait Until Page Contains Element        //div[2]//h2[contains(text(),'Your data belongs to you')]
    #the footer message
    Wait Until Page Contains Element        //div[contains (@class, 'small text-muted')]//div[contains  (@text, 'By selecting "Continue" you agree to the ')]
    sleep                                   3
    Click ELement                           //*span[contains (@text, 'Continue')]

Search the Bank
    [Documentation]                         Search the input bank
    [Arguments]                             ${selected_bank}
    Wait Until Page Contains Element        //div[1]//h1[contains(text(),'Select your bank')]
    wait for and input text                 //input[@type = 'text']   ${selected_bank}

Enter the credential
    [Documentation]                         Enter the credentials
    [Arguments]                             ${username}     ${password}
    wait for and input text                 //input[@id = 'username']   ${username}
    wait for and input text                 //input[@id = 'password']   ${password}
    Click Element                           //button[@id = 'aut-submit-button']

Rest Password
# this test case retrives the window handle of the new window
# two arguments ${account number} and ${social security}
#if condition - click continue
#else condition- click cancel


