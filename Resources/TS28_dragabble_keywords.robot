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

Validate the element position
    [Arguments]     ${locator}   ${x}   ${y}
    ${element_after_left_position}      Get CSS Property Value          ${locator}           left
    ${element_after_top_position}       Get CSS Property Value          ${locator}           top
    should be equal as strings          ${element_after_left_position}  ${x}px
    should be equal as strings          ${element_after_top_position}   ${y}px

Validate the element position with invalid expected result
    [Arguments]     ${locator}   ${x}   ${y}
    ${element_after_left_position}      Get CSS Property Value          ${locator}           left
    ${element_after_top_position}       Get CSS Property Value          ${locator}           top
    should not be equal as strings      ${element_after_left_position}  ${x}px
    should not be equal as strings      ${element_after_top_position}   ${y}px