*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}                 https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
${VALID_USERNAME}      Admin
${VALID_PASSWORD}      admin123
${INVALID_USERNAME}    AdminWrong
${INVALID_PASSWORD}    wrong123

*** Test Cases ***
Login Thành Công
    [Documentation]    Kiểm tra đăng nhập thành công với tài khoản hợp lệ
    Mở Trình Duyệt
    Đăng Nhập    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Kiểm Tra Đăng Nhập Thành Công
    Capture Page Screenshot
    Close Browser

Login Thất Bại
    [Documentation]    Kiểm tra đăng nhập thất bại với tài khoản không hợp lệ
    Mở Trình Duyệt
    Đăng Nhập    ${INVALID_USERNAME}    ${INVALID_PASSWORD}
    Kiểm Tra Đăng Nhập Thất Bại
    Capture Page Screenshot
    Close Browser

*** Keywords ***
Mở Trình Duyệt
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Wait Until Element Is Visible    name=username    timeout=10s

Đăng Nhập
    [Arguments]    ${username}    ${password}
    Input Text    name=username    ${username}
    Input Text    name=password    ${password}
    Click Element    xpath=//button[@type="submit"]
    Wait Until Page Contains Element    xpath=//div[@id="app"]    timeout=10s

Kiểm Tra Đăng Nhập Thành Công
    Wait Until Element Is Visible    xpath=//h6[text()="Dashboard"]    timeout=10s
    Page Should Contain    Dashboard

Kiểm Tra Đăng Nhập Thất Bại
    Wait Until Element Is Visible    xpath=//p[contains(text(),"Invalid credentials")]    timeout=10s
    Page Should Contain    Invalid credentials
