*** Settings ***
Library                 BuiltIn
Library                 Collections
Library                 SeleniumLibrary
Variables               ../PageObjects/Locators.py

*** Keywords ***
Click Start
    ${pre_value}                get text                        ${output_percent}
    click button                ${btn_start_stop}
    set global variable         ${pre_value}

Click Stop
    click button                ${btn_start_stop}

Click Reset
    click button                ${btn_reset}

Verify progress bar value has changed
    [Arguments]  ${percent}
    ${value}                    get text                        ${output_percent}
    should be equal             ${value}                    ${percent}