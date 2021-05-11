*** Settings ***
Library                 BuiltIn
Library                 Collections
Library                 SeleniumLibrary
Variables               ../PageObjects/Locators.py

*** Keywords ***
Hover cursor over
    [Arguments]  ${locator}
    mouse over                  ${locator}
    sleep   1

Verify tooltip text
    [Arguments]  ${message_locator}
    ${text}     get text                ${tooltip_inner}
    should be equal as strings          ${message_locator}   ${text}

Verify color changing
    [Arguments]  ${variable_1}  ${variable_2}
    should not be equal as strings      ${variable_1}      ${variable_2}

Get background color before hover
    [Arguments]  ${locator}
    ${element_before_background}        Get CSS Property Value    ${locator}    background-color
    set global variable     ${element_before_background}

Get background color after hover
    [Arguments]  ${locator}
    ${element_after_background}        Get CSS Property Value    ${locator}    background-color
    set global variable     ${element_after_background}