*** Settings ***
Library                 BuiltIn
Library                 Collections
Library                 SeleniumLibrary
Variables               ../PageObjects/Locators.py

*** Keywords ***
Count tabs
    [Arguments]  ${btn_tab}
    ${number_of_tabs}           get element count   ${btn_tab}
    ${number_of_tabs}   evaluate            ${btn_tab}
    set global variable         ${number_of_tabs}

Click tab number
    [Arguments]  ${number}
    ${button_attribute}         get element attribute   (${btn_tab})[${number}]   data-rb-event-key
    click link                  ${btn_tab_click}${button_attribute}')]
    set global variable         ${button_attribute}

Verify activated tab
    ${visiable}                 get element attribute   ${btn_tab_click}${button_attribute}')]    aria-selected
    should be equal as strings  ${visiable}     true

Verify activated tab content
    ${visibility_attribute}     get element attribute   ${tab_content}${button_attribute}')]   aria-hidden
    should be equal as strings  ${visibility_attribute}  false