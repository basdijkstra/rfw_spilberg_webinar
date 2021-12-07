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
    Login As  username=john  password=demo
    Navigate Via User Menu To  ${link_request_loan}
    Submit Loan Application  amount=1000  downpayment=100  fromaccountid=12900
    Check Loan Application Result Is  Approved

*** Keywords ***
Login As
    [Arguments]  ${username}  ${password}
    Wait And Type  ${textfield_username}  ${username}
    Wait And Type  ${textfield_password}  ${password}
    Wait And Click Button  ${button_login}

Navigate Via User Menu To
    [Arguments]  ${link}
    Wait And Click Link  ${link_request_loan}

Submit Loan Application
    [Arguments]  ${amount}  ${downpayment}  ${fromaccountid}
    Wait And Type  ${textfield_loanamount}  ${amount}
    Wait And Type  ${textfield_downpayment}  ${downpayment}
    Wait And Select Value  ${dropdown_fromaccount}  ${fromaccountid}
    Wait And Click Button  ${button_requestloan}

Check Loan Application Result Is
    [Arguments]  ${expected_result}
    Check Element Text  ${textlabel_loanresult}  ${expected_result}

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
