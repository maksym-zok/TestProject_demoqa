*** Settings ***
Library                 BuiltIn
Library                 Collections
Library                 SeleniumLibrary
Variables               ../PageObjects/Locators.py

*** Keywords ***
Count list items
    [Arguments]  ${locator}
    ${elements}     get element count   ${locator}
    set global variable                 ${elements}

Count grid items
    [Arguments]  ${locator}
    ${elements}     get element count   ${locator}
    set global variable                 ${elements}

Open List
    click element                       ${btn_selectable_list}
    element attribute value should be   ${btn_selectable_list}  aria-selected   true

Open Grid
    click element                       ${btn_selectable_grid}
    element attribute value should be   ${btn_selectable_grid}  aria-selected   true

Verify color changing
    [Arguments]  ${variable_1}  ${variable_2}
    should not be equal as strings      ${variable_1}      ${variable_2}

Verify color has not changed
    [Arguments]  ${variable_1}  ${variable_2}
    should be equal as strings      ${variable_1}      ${variable_2}

Get background color before click
    [Arguments]  ${locator}
    ${element_before_background}        Get CSS Property Value    ${locator}    background-color
    set global variable     ${element_before_background}

Get background color after click
    [Arguments]  ${locator}
    mouse over      ${btn_selectable_grid}
    ${element_after_background}        Get CSS Property Value    ${locator}    background-color
    set global variable     ${element_after_background}