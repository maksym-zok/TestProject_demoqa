*** Settings ***
Library                 BuiltIn
Library                 Collections
Library                 SeleniumLibrary
Resource                ../Bindings/keywords.robot
Resource                ../Resources/variables.robot
Resource                ../Resources/TS24_sortable_keywords.robot
Test Setup              Start browser and maximaze  https://demoqa.com/sortable
Test Teardown           close browser

*** Test Cases ***
Check whether user is abel to move elements in List
    Open List
    Count list items    ${list_items}
    FOR     ${res}  IN RANGE    1   ${elements}
        Set global variable         ${res}
        Get text of elements bfr    ${list_items}
        Drag and drop               (${list_items})[${res}]  (${list_items})[${res+1}]
        Get text of elements aftr   ${list_items}
        Verify elements position
    END

Check whether user is unable to move elements out of the list
    Open List
    Count list items                ${list_items}
    FOR     ${res}  IN RANGE    1   ${elements}
        Get text of element                         (${list_items})[${res}]
        Drag and drop to bottom right corner        ${list_items_by_text}'${text1}']
        Verify name of the first element            ${list_items}
        Drag and drop to bottom left corner         ${list_items_by_text}'${text1}']
        Verify name of the first element            ${list_items}
        Drag and drop to top left corner            ${list_items_by_text}'${text1}']
        Verify name of the last element             ${list_items}
        Drag and drop to top right corner           ${list_items_by_text}'${text1}']
        Verify name of the last element             ${list_items}
    END

Check whether user is abel to move elements in Grid
    Open Grid
    Count grid items   ${grid_items}
    FOR     ${res}  IN RANGE    1   ${elements}
        Set global variable         ${res}
        Get text of elements bfr    ${grid_items}
        Drag and drop               (${grid_items})[${res}]  (${grid_items})[${res+1}]
        Get text of elements aftr   ${grid_items}
        Verify elements position
    END

Check whether user is unable to move elements out of the grid
    Open Grid
    Count grid items   ${grid_items}
    FOR     ${res}  IN RANGE    1   ${elements}
        Get text of element                         (${grid_items})[${res}]
        Drag and drop to bottom right corner        ${grid_items_by_text}'${text1}']
        Verify name of the first element            ${grid_items}
        Drag and drop to bottom left corner         ${grid_items_by_text}'${text1}']
        Verify name of the first element            ${grid_items}
        Drag and drop to top left corner            ${grid_items_by_text}'${text1}']
        Verify name of the last element             ${grid_items}
        Drag and drop to top right corner           ${grid_items_by_text}'${text1}']
        Verify name of the last element             ${grid_items}
    END