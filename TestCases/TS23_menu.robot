*** Settings ***
Library                 BuiltIn
Library                 Collections
Library                 SeleniumLibrary
Resource                ../Bindings/keywords.robot
Resource                ../Resources/variables.robot
Test Setup              Start browser and maximaze  https://demoqa.com/menu
Test Teardown           close browser

*** Test Cases ***
Check whether menu items are displayed when user hovers the cursor
    ${renge}    get element count   //ul[@id="nav"]//a
    ${renge}    evaluate            ${renge}+1
    FOR  ${res}     IN RANGE    1   ${renge}
        mouse over                          (//ul[@id="nav"]//a)[${res}]
    END

Check whether menu items color are changed when user hovers the cursor
    ${renge}    get element count   //ul[@id="nav"]//a
    ${renge}    evaluate            ${renge}+1
    FOR  ${res}     IN RANGE    1   ${renge}
        ${element_before_background}        Get CSS Property Value    (//ul[@id="nav"]//li)[${res}]    background-color
        should be equal as strings          ${element_before_background}    rgba(36, 175, 21, 1)
        mouse over                          (//ul[@id="nav"]//a)[${res}]
        ${element_after_background}        Get CSS Property Value    (//ul[@id="nav"]//li)[${res}]     background-color
        should be equal as strings          ${element_after_background}     rgba(0, 63, 32, 1)
    END