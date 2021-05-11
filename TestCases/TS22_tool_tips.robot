*** Settings ***
Library                 BuiltIn
Library                 Collections
Library                 SeleniumLibrary
Resource                ../Bindings/keywords.robot
Resource                ../Resources/variables.robot
Resource                ../Resources/TS22_tool_tips_keywords.robot
Test Setup              Start browser and maximaze  https://demoqa.com/tool-tips
Test Teardown           close browser

*** Test Cases ***
Check whether tooltips are displayed when user hovers the cursor
    FOR  ${res}     IN RANGE    1   5
        Hover cursor over                               ${tooltips_locators}[${res}]
        Wait until page contains element                ${find_text}'${hover_messages}[${res}]']
        Verify tooltip text                             ${hover_messages}[${res}]
    END

Check whether button is changed its color when user hovers the cursor
    Get background color before hover                   ${btn_hover}
    Hover cursor over                                   ${btn_hover}
    Get background color after hover                    ${btn_hover}
    Verify color changing                               ${element_before_background}      ${element_after_background}