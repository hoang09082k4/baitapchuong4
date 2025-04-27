*** Settings ***
Resource    ../resources/login_resource.robot

*** Test Cases ***
Login With Valid Credentials
    [Documentation]    Login thành công với tài khoản hợp lệ
    Open Browser To Login Page
    Input Credentials    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Wait Until Element Is Visible    xpath=//h6[text()="Dashboard"]    10s
    Capture Page Screenshot
    Sleep    10s
    Close Browser

Login With Invalid Credentials
    [Documentation]    Login thất bại với tài khoản không hợp lệ
    Open Browser To Login Page
    Input Credentials    ${INVALID_USERNAME}    ${INVALID_PASSWORD}
    Wait Until Element Is Visible    xpath=//p[contains(text(),"Invalid credentials")]    10s
    Capture Page Screenshot
    Sleep    10s
    Close Browser
