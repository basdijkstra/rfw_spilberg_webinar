*** Settings ***
Documentation    Accounts Overview Page object
Resource  common_keywords.resource

*** Variables ***
${textfield_loanamount}  id:amount
${textfield_downpayment}  id:downPayment
${dropdown_fromaccount}  id:fromAccountId
${button_requestloan}  xpath://input[@value='Apply Now']
${textlabel_loanresult}  id:loanStatus

*** Keywords ***
Submit Loan Application
    [Arguments]  ${amount}  ${downpayment}  ${fromaccountid}
    Wait And Type  ${textfield_loanamount}  ${amount}
    Wait And Type  ${textfield_downpayment}  ${downpayment}
    Wait And Select Value  ${dropdown_fromaccount}  ${fromaccountid}
    Wait And Click Button  ${button_requestloan}

Check Loan Application Result Is
    [Arguments]  ${expected_result}
    Check Element Text  ${textlabel_loanresult}  ${expected_result}