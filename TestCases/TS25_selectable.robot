*** Settings ***
Library                 BuiltIn
Library                 Collections
Library                 SeleniumLibrary
Resource                ../Bindings/keywords.robot
Resource                ../Resources/variables.robot
Resource                ../Resources/TS25_selectable_keywords.robot
Test Setup              Start browser and maximaze  https://demoqa.com/selectable
Test Teardown           close browser

*** Test Cases ***
Check whether user is abel to select elements in List
    Open List
    Count list items    ${list_selectable_items}
    FOR  ${res}     IN RANGE  1  ${elements}
        Get background color before click   (${list_selectable_items})[${res}]
        click element                       (${list_selectable_items})[${res}]
        Get background color after click    (${list_selectable_items})[${res}]
        Verify color changing               ${element_before_background}      ${element_after_background}
    END

Check whether user is abel to unselect elements in List
    Open List
    Count list items    ${list_selectable_items}
    FOR  ${res}     IN RANGE  1  ${elements}
        Get background color before click   (${list_selectable_items})[${res}]
        click element                       (${list_selectable_items})[${res}]
        Click element                       (${list_selectable_items})[${res}]
        Get background color after click    (${list_selectable_items})[${res}]
        Verify color has not changed        ${element_before_background}      ${element_after_background}
    END

Check whether user is abel to select elements in Grid
    Open Grid
    Count list items    ${grid_selectable_items}
    FOR  ${res}     IN RANGE  1  ${elements}
        Get background color before click   (${grid_selectable_items})[${res}]
        click element                       (${grid_selectable_items})[${res}]
        Get background color after click    (${grid_selectable_items})[${res}]
        Verify color changing               ${element_before_background}      ${element_after_background}
    END

Check whether user is abel to unselect elements in Grid
    Open Grid
    Count list items    ${grid_selectable_items}
    FOR  ${res}     IN RANGE  1  ${elements}
        Get background color before click   (${grid_selectable_items})[${res}]
        click element                       (${grid_selectable_items})[${res}]
        Click element                       (${grid_selectable_items})[${res}]
        Get background color after click    (${grid_selectable_items})[${res}]
        Verify color has not changed        ${element_before_background}      ${element_after_background}
    END