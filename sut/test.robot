*** Settings ***
Library           Selenium2Library


*** Variables ***
${ACCOUNT}                                                    sam12345641
${PASSWORD}                                                   AB810821cd
${LOGIN URL}      https://login.yahoo.com/
${BROWSER}        Chrome

*** Test Cases ***
Valid Login
    Open Browser To Login Page
    Input Username    ${ACCOUNT}
    Submit Credentials
    Wait A Little Bit
    Input Password    ${PASSWORD}
    Submit Credentials
    Wait For MainPage Open
    Welcome Page Should Be Open
    [Teardown]    Close Browser

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Title Should Be    Yahoo

Input Username
    [Arguments]     ${username}
    Input Text    login-username    ${username}

Input Password
    [Arguments]     ${password}
    Input Text    login-passwd      ${password}

Submit Credentials
    Click Button    id:login-signin

Welcome Page Should Be Open
    Title Should Be    Yahoo奇摩

Wait A Little Bit
    Wait Until Element Is Visible     login-passwd

Wait For MainPage Open
    Wait Until Element Is Visible     //input[@id="header-search-input"]
