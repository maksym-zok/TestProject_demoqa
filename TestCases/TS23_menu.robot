*** Settings ***
Library                 BuiltIn
Library                 Collections
Library                 SeleniumLibrary
Resource                ../Bindings/keywords.robot
Resource                ../Resources/variables.robot
Resource                ../Resources/TS23_menu_keywords.robot
Test Setup              Start browser and maximaze  https://demoqa.com/menu
Test Teardown           close browser

*** Test Cases ***
Check whether menu items are displayed when user hovers the cursor
    Count menu items    ${btn_menu_item_a}
    FOR  ${res}     IN RANGE    1   ${range}
        Hover cursor over   (${btn_menu_item_a})[${res}]
    END
Check whether menu items color are changed when user hovers the cursor
    Count menu items    ${btn_menu_item_a}
    FOR  ${res}     IN RANGE    1   ${range}
        Get background color before hover   (${btn_menu_item_li})[${res}]
        Hover cursor over   (${btn_menu_item_a})[${res}]
        Get background color after hover    (${btn_menu_item_li})[${res}]
        Verify color changing               ${element_before_background}      ${element_after_background}
    END