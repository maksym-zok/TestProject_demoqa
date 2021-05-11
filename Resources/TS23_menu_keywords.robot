*** Settings ***
Library                 BuiltIn
Library                 Collections
Library                 SeleniumLibrary
Variables               ../PageObjects/Locators.py

*** Keywords ***
Count menu items
    [Arguments]  ${locator}
    ${range}    get element count   ${locator}
    ${range}    evaluate            ${range}+1
    set global variable             ${range}

Hover cursor over
    [Arguments]  ${locator}
    mouse over                  ${locator}

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