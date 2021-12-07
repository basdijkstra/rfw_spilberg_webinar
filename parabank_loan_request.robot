*** Settings ***
Documentation    Tests to verify that we can request a loan
Library  SeleniumLibrary
Resource  common_keywords.resource
Resource  loginpage.resource
Test Setup  Open And Maximize Browser  http://localhost:8080/parabank  Chrome
Test Teardown  Close Browser

*** Variables ***
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
