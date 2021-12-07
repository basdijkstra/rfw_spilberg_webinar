*** Settings ***
Documentation    Login Page object
Resource  common_keywords.resource

*** Variables ***
${textfield_username}  name:username
${textfield_password}  name:password
${button_login}  xpath://input[@value='Log In']

*** Keywords ***
Login As
    [Arguments]  ${username}  ${password}
    Wait And Type  ${textfield_username}  ${username}
    Wait And Type  ${textfield_password}  ${password}
    Wait And Click Button  ${button_login}
