*** Settings ***
Library                 BuiltIn
Library                 Collections
Library                 SeleniumLibrary
Resource                ../Bindings/keywords.robot
Resource                ../Resources/variables.robot
Test Setup              Start browser and maximaze  https://demoqa.com/selectable
Test Teardown           close browser

*** Test Cases ***
Check whether user is abel to select elements in List
    click element                       //a[text()='List']
    element attribute value should be   //a[text()='List']  aria-selected   true
    ${elements}     get element count   //div[@id="demo-tabpane-list"]//li
    ${elements+1}   evaluate            ${elements}+1
    FOR  ${res}     IN RANGE  1  ${elements+1}
        ${element_before_background}        Get CSS Property Value    (//div[@id="demo-tabpane-list"]//li)[${res}]     background-color
        should be equal as strings          ${element_before_background}    rgba(255, 255, 255, 1)
        click element                       (//div[@id="demo-tabpane-list"]//li)[${res}]
        ${element_after_background}         Get CSS Property Value    (//div[@id="demo-tabpane-list"]//li)[${res}]     background-color
        should be equal as strings          ${element_after_background}    rgba(0, 123, 255, 1)
    END

Check whether user is abel to unselect elements in List
    click element                       //a[text()='List']
    element attribute value should be   //a[text()='List']  aria-selected   true
    ${elements}     get element count   //div[@id="demo-tabpane-list"]//li
    ${elements+1}   evaluate            ${elements}+1
    FOR  ${res}     IN RANGE  1  ${elements+1}
        ${element_before_background}        Get CSS Property Value    (//div[@id="demo-tabpane-list"]//li)[${res}]     background-color
        should be equal as strings          ${element_before_background}    rgba(255, 255, 255, 1)
        click element                       (//div[@id="demo-tabpane-list"]//li)[${res}]
        ${element_after_background}         Get CSS Property Value    (//div[@id="demo-tabpane-list"]//li)[${res}]     background-color
        should be equal as strings          ${element_after_background}    rgba(0, 123, 255, 1)
        click element                       (//div[@id="demo-tabpane-list"]//li)[${res}]
        click element                       //a[text()='List']
        ${element_before_background}        Get CSS Property Value    (//div[@id="demo-tabpane-list"]//li)[${res}]     background-color
        should be equal as strings          ${element_before_background}    rgba(255, 255, 255, 1)
    END

Check whether user is abel to select elements in Grid
    click element                       //a[text()='Grid']
    element attribute value should be   //a[text()='Grid']  aria-selected   true
    ${elements}     get element count   //div[@id="demo-tabpane-grid"]//li
    ${elements+1}   evaluate            ${elements}+1
    FOR  ${res}     IN RANGE  1  ${elements+1}
        ${element_before_background}        Get CSS Property Value    (//div[@id="demo-tabpane-grid"]//li)[${res}]     background-color
        should be equal as strings          ${element_before_background}    rgba(255, 255, 255, 1)
        click element                       (//div[@id="demo-tabpane-grid"]//li)[${res}]
        ${element_after_background}         Get CSS Property Value    (//div[@id="demo-tabpane-grid"]//li)[${res}]     background-color
        should be equal as strings          ${element_after_background}    rgba(0, 123, 255, 1)
    END

Check whether user is abel to unselect elements in Grid
    click element                       //a[text()='Grid']
    element attribute value should be   //a[text()='Grid']  aria-selected   true
    ${elements}     get element count   //div[@id="demo-tabpane-grid"]//li
    ${elements+1}   evaluate            ${elements}+1
    FOR  ${res}     IN RANGE  1  ${elements+1}
        ${element_before_background}        Get CSS Property Value    (//div[@id="demo-tabpane-grid"]//li)[${res}]     background-color
        should be equal as strings          ${element_before_background}    rgba(255, 255, 255, 1)
        click element                       (//div[@id="demo-tabpane-grid"]//li)[${res}]
        ${element_after_background}         Get CSS Property Value    (//div[@id="demo-tabpane-grid"]//li)[${res}]     background-color
        should be equal as strings          ${element_after_background}    rgba(0, 123, 255, 1)
        click element                       (//div[@id="demo-tabpane-grid"]//li)[${res}]
        click element                       //a[text()='Grid']
        ${element_before_background}        Get CSS Property Value    (//div[@id="demo-tabpane-grid"]//li)[${res}]     background-color
        should be equal as strings          ${element_before_background}    rgba(255, 255, 255, 1)
    END