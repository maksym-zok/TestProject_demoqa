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
    click element                       ${btn_list}
    element attribute value should be   ${btn_list}  aria-selected   true

Open Grid
    click element                       ${btn_grid}
    element attribute value should be   ${btn_grid}  aria-selected   true

Get text of element
    [Arguments]  ${locator}
    sleep                       2
    ${text1}                    get text        ${locator}
    set global variable         ${text1}

Get text of elements bfr
    [Arguments]  ${locator}
    ${res+1}                    evaluate        ${res}+1
    sleep                       1
    ${text1}                    get text        (${locator})[${res}]
    ${text2}                    get text        (${locator})[${res+1}]
    set global variable         ${text1}
    set global variable         ${text2}

Get text of elements aftr
    [Arguments]  ${locator}
    ${text1_after}              get text        (${locator})[${res}]
    ${text2_after}              get text        (${locator})[${res+1}]
    set global variable         ${text1_after}
    set global variable         ${text2_after}

Verify elements position
    should be equal as strings  ${text1}        ${text2_after}
    should be equal as strings  ${text2}        ${text1_after}

Drag and drop to bottom right corner
    [Arguments]  ${locator}
    drag and drop by offset     ${locator}     400   -300

Drag and drop to bottom left corner
    [Arguments]  ${locator}
    drag and drop by offset     ${locator}     -400   -300

Drag and drop to top left corner
    [Arguments]  ${locator}
    drag and drop by offset     ${locator}     -400   300

Drag and drop to top right corner
    [Arguments]  ${locator}
    drag and drop by offset     ${locator}     400   300

Verify name of the first element
    [Arguments]  ${locator}
    element text should be                      (${locator})[1]  ${text1}

Verify name of the last element
    [Arguments]  ${locator}
    element text should be                      (${locator})[${elements}]  ${text1}