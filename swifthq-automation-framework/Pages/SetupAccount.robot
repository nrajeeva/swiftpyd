*** Settings ***
Documentation    Suite for all the Sign Up keywords
*** Keywords ***
Setup Account Layout
    [Documentation]                         Navigate to the Setup Account page
    #Header part of the window
    Wait Until Page Contains Element        //div[2]//h3[contains(text(),'Sign up or login')]
    #The phone box available
    Wait Until Page Contains Element        //div[contains (@class, 'renderInModal row')]//div[contains  (@id, 'phone')]
    #the footer message
    Wait Until Page Contains Element        //div[contains (@class, 'small text-muted')]//div[contains  (@text, 'By clicking continue you agree to the ')]

Valid Login User
    [Documentation]                         Check the Login functionality
    [Arguments]                             ${phone_number}
    wait for and input text                 //div[contains (@class, 'renderInModal row')]//div[contains  (@id, 'phone')]        ${phone_number}
    sleep                                   2
    Click Element                           //input[(@type = 'submit'),(@value = 'Continue')]

Invalid Login User
    [Documentation]                         Check the Login functionality for invalid user
    [Arguments]                             ${invalidphone_number}
    wait for and input text                 //div[contains (@class, 'renderInModal row')]//div[contains  (@id, 'phone')]        ${invalidphone_number}
    sleep                                   2
    Click Element                           //input[(@type = 'submit'),(@value = 'Continue')]
    Page Should Contain                     Please enter a valid number

Valid OTP Run
    [Documentation]                         Check the Login functionality after the OTP is received
    [Arguments]                             ${phone_number}     ${otp}
    Page Should Contain                     Enter the verification code sent to ${phone_number}
    For                                     ${i}                IN RANGE                ${otp}
        ${i}=                               Evaluate            ${i} + 1
        Input Text                          //input[@id = 'input-part-${i}']
    END
    Click Element                           //button[@type = 'submit']







