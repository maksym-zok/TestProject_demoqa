*** Settings ***
Library                 SeleniumLibrary
Variables               ../PageObjects/Locators.py

*** Keywords ***
Verify message after double click
    [Arguments]     ${message}
    element should contain          ${btn_double_message}   ${message}

Verify message after right click
    [Arguments]     ${message}
    element should contain          ${btn_context_message}   ${message}

Verify message after left click
    [Arguments]     ${message}
    element should contain          ${btn_one_click_message}   ${message}

Verify misclick
    [Arguments]     ${invisible_div}
    element should not be visible   ${invisible_div}