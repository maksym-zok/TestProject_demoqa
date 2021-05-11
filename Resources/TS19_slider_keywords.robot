*** Settings ***
Library                 BuiltIn
Library                 Collections
Library                 SeleniumLibrary
Variables               ../PageObjects/Locators.py

*** Keywords ***
Move the slider along X by pixels
    [Arguments]  ${x}
    drag and drop by offset     ${btn_input_slider}    ${x}  0

Verify slider position after offset
    [Arguments]  ${after_offset}
    ${current_value}            get value           ${btn_input_slider}
    should be equal             ${after_offset}     ${current_value}