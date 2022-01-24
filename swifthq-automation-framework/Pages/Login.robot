*** Settings ***
Documentation    Suite for Login test cases keywords
Resource        resource.robot

*** Variables ***
${login_url}='https://payjs-dev.swifterhq.co/demo.html'
*** Keywords ***
Open Browser to Swift Login Page
    [Documentation]     Opens the browser to the Swifter main page.
    [Arguments]                 ${browser}=${BROWSER}           ${login_url}       ${node}=${LABEL}
    Run Keyword If              '${browser.upper()}'=='FIREFOX'  Open Firefox Browser           ${login_url}
    Run Keyword If              '${browser.upper()}'=='EDGE'    Open Edge Browser               ${login_url}
    Run Keyword If              '${browser.upper()}'=='CHROME' and '${proxy}'=='${EMPTY}' and '${node.upper()}'!='BETA'
    ...                         Open Chrome Browser             ${login_url}
    Wait Until Page Contains Element  //button[@id='start']
    ${handles}=                 Get Window Handles

Open Chrome Browser
    [Arguments]                 ${login_url}=${LOGIN_URL}   ${language}='English'

    ${preferences}=             Create Dictionary               browser.download.prompt_for_download=False  chrome_options=no-sandbox
    ${options}=                 Evaluate                        sys.modules['selenium.webdriver'].ChromeOptions()   sys
    Call Method                 ${options}                      add_argument                    --no-sandbox
    Call Method                 ${options}                      add_argument                    --disable-extensions
    Call Method                 ${options}                      add_argument                    --disable-infobars
    Call Method                 ${options}                      add_argument                    --ignore-certificate-errors
    Run Keyword If              ${language}=='French'      Open Browser    ${login_url}    browser=chrome                 desired_capabilities=${preferences}      options=add_argument("lang=fr-ca")
    ...  ELSE                   Create WebDriver           Chrome                          chrome_options=${options}      desired_capabilities=${preferences}
    Go To                       ${LOGIN_URL}

Welcome Page Layout
    [Documentation]                 This keyword is for testing the layout of the Welcome page.
    # Create Session
    Wait Until Element Is Visible   //button[@id='create-session']
    # Exisiting Session
    Element Should Be Visible       //input[@name = 'sessionId']
    Element Should Be Visible       //button[@id='start']

Click Create Seesion
    [Documentation]                 This Keyword is used to understand functionality of create session
    Wait Until Element Is Visible   //div[1]//h3[contains(text(),'Create New Session')]
    CLick Element                   //div[1]//h3[contains(text(),'Create New Session')]

Click the Exisiting User
    [Documentation]                 This keyword is used to understand the functionality of exisiting used id
    [Arguments]                     ${session_id}
    Wait Until Element Is Visible   //div[2]//h3[contains(text(),'Use Existing Session')]
    Wait Until Element Is Visible   //div[2]//label[contains(text(),'Session ID')]
    Input Text                      //input[@id='sessionId']        ${session_id}

