*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}              https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
${VALID_USERNAME}   Admin
${VALID_PASSWORD}   admin123
${INVALID_USERNAME} AdminWrong
${INVALID_PASSWORD} wrong123
${BROWSER}          Chrome

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible    name=username    timeout=10s

Input Credentials
    [Arguments]    ${username}    ${password}
    Input Text    name=username    ${username}
    Input Text    name=password    ${password}
    Click Button  xpath=//button[@type="submit"]
