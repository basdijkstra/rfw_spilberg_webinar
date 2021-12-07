*** Settings ***
Documentation    Tests to verify that we can request a loan
Library  SeleniumLibrary

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
    Open Browser  http://localhost:8080/parabank  Chrome
    Maximize Browser Window
    Wait Until Element Is Enabled  ${textfield_username}
    Input Text  ${textfield_username}  john
    Wait Until Element Is Enabled  ${textfield_password}
    Input Text  ${textfield_password}  demo
    Wait Until Element Is Enabled  ${button_login}
    Click Button  ${button_login}
    Wait Until Element Is Enabled  ${link_request_loan}
    Click Link  ${link_request_loan}
    Wait Until Element Is Enabled  ${textfield_loanamount}
    Input Text  ${textfield_loanamount}  1000
    Wait Until Element Is Enabled  ${textfield_downpayment}
    Input Text  ${textfield_downpayment}  10
    Wait Until Element Is Enabled  ${dropdown_fromaccount}
    Select From List By Value  ${dropdown_fromaccount}  12900
    Wait Until Element Is Enabled  ${button_requestloan}
    Click Button  ${button_requestloan}
    Wait Until Element Is Visible  ${textlabel_loanresult}
    Element Text Should Be  ${textlabel_loanresult}  Approved
    Close Browser
