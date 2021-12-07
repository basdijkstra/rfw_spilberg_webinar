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
