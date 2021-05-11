*** Settings ***
Library                 BuiltIn
Library                 Collections
Library                 SeleniumLibrary
Variables               ../PageObjects/Locators.py

*** Keywords ***
Open tab
    [Arguments]     ${locator}
    click element                       ${locator}
    sleep       1
    element attribute value should be   ${locator}  aria-selected   true

Get background color before drop
    [Arguments]  ${locator}
    ${element_before_background}        Get CSS Property Value    ${locator}    background-color
    set global variable     ${element_before_background}

Get background color after drop
    [Arguments]  ${locator}
    ${element_after_background}        Get CSS Property Value    ${locator}    background-color
    set global variable     ${element_after_background}

Get element position before drop
    [Arguments]  ${locator}
    ${position_before}                   Get CSS Property Value          ${locator}   left
    set global variable       ${position_before}

Get element position after drop
    [Arguments]  ${locator}
    sleep   1
    ${position_after}                   Get CSS Property Value          ${locator}   left
    set global variable       ${position_after}

Verify position changing
    [Arguments]  ${variable_1}  ${variable_2}
    should not be equal as strings      ${variable_1}      ${variable_2}

Verify position is not changing
    [Arguments]  ${variable_1}  ${variable_2}
    should be equal as strings      ${variable_1}      ${variable_2}

Verify text before drop
    [Arguments]  ${locator}  ${text}
    wait until page contains    ${text}
    element text should be  ${locator}  ${text}

Verify text after drop
    [Arguments]  ${locator}  ${text}
    wait until page contains    ${text}
    wait until element contains  ${locator}  ${text}

Verify element position
    [Arguments]  ${locator}  ${position}
    ${position_after}                   Get CSS Property Value          ${locator}   left
    should be equal as strings          ${position_after}               ${position}

Verify color changing
    [Arguments]  ${variable_1}  ${variable_2}
    should not be equal as strings      ${variable_1}      ${variable_2}

Verify color is not changing
    [Arguments]  ${variable_1}  ${variable_2}
    should be equal as strings      ${variable_1}      ${variable_2}
#
#Verify color has not changed
#    [Arguments]  ${variable_1}  ${variable_2}
#    should be equal as strings      ${variable_1}      ${variable_2}
#
#Get background color before click
#    [Arguments]  ${locator}
#    ${element_before_background}        Get CSS Property Value    ${locator}    background-color
#    set global variable     ${element_before_background}
#
#Get background color after click
#    [Arguments]  ${locator}
#    mouse over      ${btn_selectable_grid}
#    ${element_after_background}        Get CSS Property Value    ${locator}    background-color
#    set global variable     ${element_after_background}