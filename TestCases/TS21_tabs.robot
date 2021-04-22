*** Settings ***
Library                 BuiltIn
Library                 Collections
Library                 SeleniumLibrary
Resource                ../Bindings/keywords.robot
Resource                ../Resources/variables.robot
Test Setup              Start browser and maximaze  https://demoqa.com/tabs
Test Teardown           close browser

*** Test Cases ***
Check whether user is able to navigate the available tabs
    ${number_of_tabs}   get element count   //nav[@class="nav nav-tabs"]/a
    ${number_of_tabs}   evaluate            ${number_of_tabs}+1
    FOR  ${res}  IN RANGE  1  ${number_of_tabs}
        ${button_attribute}         get element attribute   (//nav[@class="nav nav-tabs"]/a)[${res}]                            data-rb-event-key
        click link                  //a[contains(@aria-controls,'demo-tabpane-${button_attribute}')]
        ${visiable}                 get element attribute   //a[contains(@aria-controls,'demo-tabpane-${button_attribute}')]    aria-selected
        should be equal as strings  ${visiable}     true
    END

Check whether tabs display related to their content
    ${number_of_tabs}   get element count   //nav[@class="nav nav-tabs"]/a
    ${number_of_tabs}   evaluate            ${number_of_tabs}+1
    FOR  ${res}  IN RANGE  1  ${number_of_tabs}
        ${button_attribute}         get element attribute   (//nav[@class="nav nav-tabs"]/a)[${res}]                            data-rb-event-key
        click link                  //a[contains(@aria-controls,'demo-tabpane-${button_attribute}')]
        ${visibility_attribute}     get element attribute   //div[contains(@aria-labelledby, 'demo-tab-${button_attribute}')]   aria-hidden
        should be equal as strings  ${visibility_attribute}  false
    END