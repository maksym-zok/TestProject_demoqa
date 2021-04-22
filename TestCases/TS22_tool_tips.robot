*** Settings ***
Library                 BuiltIn
Library                 Collections
Library                 SeleniumLibrary
Resource                ../Bindings/keywords.robot
Resource                ../Resources/variables.robot
Test Setup              Start browser and maximaze  https://demoqa.com/tool-tips
Test Teardown           close browser

*** Test Cases ***
Check whether tooltips are displayed when user hovers the cursor
    FOR  ${res}     IN RANGE    1   5
        mouse over                          ${tooltips_locators}[${res}]
        sleep   1
        wait until page contains element    //div[text()='${hover_messages}[${res}]']
        ${text}     get text                //div[@class="tooltip-inner"]
        should be equal as strings          ${hover_messages}[${res}]   ${text}
    END

Check whether button is changed its color when user hovers the cursor
    ${element_before_background}                        Get CSS Property Value    id:toolTipButton    background-color
    ${element_before_border}                            Get CSS Property Value    id:toolTipButton    border-color
    mouse over                                          id=toolTipButton
    ${element_after_background}                         Get CSS Property Value    id:toolTipButton    background-color
    ${element_after_border}                             Get CSS Property Value    id:toolTipButton    border-color
    should be equal as strings                          rgba(33, 136, 56, 1)      ${element_after_background}
    should be equal as strings                          rgb(30, 126, 52)          ${element_after_border}