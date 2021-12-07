*** Settings ***
Documentation    Tests to verify that we can request a loan
Library  SeleniumLibrary
Test Setup  Open And Maximize Browser  http://localhost:8080/parabank  Chrome
Test Teardown  Close Browser

*** Variables ***
${textfield_username}  name:username
${textfield_password}  name:password
${button_login}  xpath://input[@value='Log In']
${link_request_loan}  link:Request Loan
${textfield_loanamount}  id:amount
${textfield_downpayment}  id:downPayment
${dropdown_fromaccount}  id:fromAccountId
${button_requestloan}  xpath://input[@value='Apply Now']
${textlabel_loanresult}  id:loanStatus

*** Test Cases ***
Requesting a loan within parameters should be successful
    Wait And Type  ${textfield_username}  john
    Wait And Type  ${textfield_password}  demo
    Wait And Click Button  ${button_login}
    Wait And Click Link  ${link_request_loan}
    Wait And Type  ${textfield_loanamount}  1000
    Wait And Type  ${textfield_downpayment}  10
    Wait And Select Value  ${dropdown_fromaccount}  12900
    Wait And Click Button  ${button_requestloan}
    Check Element Text  ${textlabel_loanresult}  Approved


*** Keywords ***
Open And Maximize Browser
    [Arguments]  ${url}  ${browser}
    Open Browser  ${url}  ${browser}
    Maximize Browser Window

Wait And Type
   [Arguments]  ${locator}  ${value}
   Wait Until Element Is Enabled  ${locator}
   Input Text  ${locator}  ${value}

Wait And Click Button
    [Arguments]  ${locator}
    Wait Until Element Is Enabled  ${locator}
    Click Button  ${locator}

Wait And Click Link
    [Arguments]  ${locator}
    Wait Until Element Is Enabled  ${locator}
    Click Link  ${locator}

Wait And Select Value
    [Arguments]  ${locator}  ${value_to_select}
    Wait Until Element Is Enabled  ${locator}
    Select From List By Value  ${locator}  ${value_to_select}

Check Element Text
    [Arguments]  ${locator}  ${expected_text}
    Wait Until Element Is Visible  ${locator}
    Element Text Should Be  ${locator}  ${expected_text}
