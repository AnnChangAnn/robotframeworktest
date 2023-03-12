*** Settings ***
Library           Selenium2Library

*** Variables ***
${username}       nt87695@cathaybk.com.tw
${password}       Aaa123456789.
${LOGIN URL}      https://academy.uipath.com/
${BROWSER}        Chrome

*** Test Cases ***
Valid Login
    Open Browser To Login Page
    Click Login/Sign up
    Click Login With Email
    Input Username     ${username}
    Input Password     ${password}
    Submit Credentials
    Welcome Page Should Be Open
    [Teardown]    Close Browser

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Title Should Be    UiPath Academy

Input Username
    [Arguments]    ${username}
    Wait Until Element Is Visible     css:[name="email"][data-cy="login-email-input"]
    Input Text    css:[name="email"][data-cy="login-email-input"]     ${username}

Input Password
    [Arguments]    ${password}
    Input Text    css:[name="password"][data-cy="login-password-input"]    ${password}

Click Login/Sign up
    Wait Until Element Is Visible     //div[@class="login-register-btn"]     15
    Click element    //div[@class="login-register-btn"]
    
Click Login With Email
    Wait Until Element Is Enabled     css:p[class="MuiTypography-root jss56 MuiTypography-body1"][data-cy="login-goto-signup"]
    Click element      //button[@data-cy="authorize-with-email"]

Submit Credentials
    Click Element     css:button[data-cy="login-button"]

Welcome Page Should Be Open
    Wait Until Element Is Visible     css:.col-sm-12     15

    
