*** Settings ***
Library           SeleniumLibrary
Library           String
Library           ExcelRobot
Library           OperatingSystem
Library           DateTime

*** Variables ***
        

*** Keywords ***
Open and maximize browser
    open browser    ${url}    ${browser}    
    Maximize Browser Window

wait and input text
    [Arguments]    ${locator}    ${txt_value}
    wait until element is visible    ${locator}
    input text    ${locator}    ${txt_value}

wait and click element
    [Arguments]    ${locator}
    wait until element is visible    ${locator}
    click element    ${locator}

wait and click button
    [Arguments]    ${locator}
    Wait Until Element Is Visible    ${locator}
    Wait Until Element Is Enabled    ${locator}
    click button    ${locator}

Check Element Visible
    [Arguments]    ${locator}
    ${present}=    run keyword and return status    ELEMENT SHOULD BE VISIBLE    ${locator}    10s
    [Return]    ${locator}

Choose and upload file
    [Arguments]  ${locator}  ${path}
    wait until element is enabled  ${locator}
    choose file  ${locator}  ${path}

Select App Frame
    [Arguments]     ${iframe}
    wait until page contains element            ${iframe}           40s
    wait until keyword succeeds             1 minute       5 seconds        element should be visible           ${iframe}
    sleep       10s
    select frame            ${iframe}
    