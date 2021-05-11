*** Settings ***
Library                 BuiltIn
Library                 Collections
Library                 SeleniumLibrary
Variables               ../PageObjects/Locators.py

*** Keywords ***
Verify color changing
    [Arguments]  ${variable_1}  ${variable_2}
    should not be equal as strings      ${variable_1}      ${variable_2}

Get window size before resize
    [Arguments]  ${locator}
    ${element_before_width}        Get CSS Property Value    ${locator}    width
    ${element_before_height}       Get CSS Property Value    ${locator}    height
    set global variable     ${element_before_height}
    set global variable     ${element_before_width}

Get window size after resize
    [Arguments]  ${locator}
    ${element_after_width}  Get CSS Property Value    ${locator}    width
    ${element_after_height}  Get CSS Property Value    ${locator}    height
    set global variable     ${element_after_height}
    set global variable     ${element_after_width}

Verify window size differences
    [Arguments]  ${after_width}  ${after_height}
    should not be equal as strings      ${element_before_width}     ${after_width}
    should not be equal as strings      ${element_before_height}     ${after_height}

Verify window is resized to
#    [Arguments]  ${size_before}  ${size_after}
#    should be equal as strings      ${size_before}     ${size_after}

    [Arguments]  ${after_width}  ${after_height}
    should be equal as strings      ${element_after_width}     ${after_width}
    should be equal as strings      ${element_after_height}     ${after_height}

Verify window size is equal
    [Arguments]  ${size_before}  ${size_after}
    should be equal as strings      ${size_before}     ${size_after}

Scroll down
    execute javascript          window.scrollTo(0,document.body.scrollHeight)






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