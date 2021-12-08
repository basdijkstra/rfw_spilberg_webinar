*** Settings ***
Documentation    Tests to verify that we can request a loan
Library  SeleniumLibrary
Resource  pages/loginpage.resource
Resource  pages/accountsoverviewpage.resource
Resource  pages/requestloanpage.resource
Test Setup  Open And Maximize Browser  http://localhost:8080/parabank  Chrome
Test Teardown  Close Browser

*** Test Cases ***
Requesting a loan within parameters should be successful
    Login As  username=john  password=demo
    Navigate To Request Loan Page
    Submit Loan Application  amount=1000  downpayment=100  fromaccountid=12900
    Check Loan Application Result Is  Approved
