*** Settings ***
Documentation    Accounts Overview Page object
Resource  common_keywords.resource

*** Variables ***
${link_request_loan}  link:Request Loan

*** Keywords ***
Navigate To Request Loan Page
    Wait And Click Link  ${link_request_loan}