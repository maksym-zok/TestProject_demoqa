*** Settings ***
Library                 BuiltIn
Library                 Collections
Library                 SeleniumLibrary
Resource                ../Bindings/keywords.robot
Resource                ../Resources/variables.robot
Resource                ../Resources/TS21_tabs_keywords.robot
Test Setup              Start browser and maximaze  https://demoqa.com/tabs
Test Teardown           close browser

*** Test Cases ***
Check whether user is able to navigate the available tabs
    Count tabs  ${btn_tab}
    FOR  ${res}  IN RANGE  1  ${number_of_tabs}
        Click tab number            ${res}
        Verify activated tab
    END

Check whether tabs display related to their content
    Count tabs  ${btn_tab}
    FOR  ${res}  IN RANGE  1  ${number_of_tabs}
        Click tab number            ${res}
        Verify activated tab content
    END