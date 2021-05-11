*** Settings ***
Library                 BuiltIn
Library                 Collections
Library                 SeleniumLibrary
Variables               ../PageObjects/Locators.py

*** Keywords ***
Verify that dialog is closed
    [Arguments]  ${xpath}
    wait until element is not visible   ${xpath}

Verify that dialog is open
    [Arguments]  ${xpath}
    wait until element is visible   ${xpath}

Open popup dialog
    [Arguments]   ${xpath}
    click element   ${xpath}

Close popup dialog
    [Arguments]   ${xpath}
    click element   ${xpath}

Verify the title
    [Arguments]     ${title}
    wait until element contains  ${output_popup_title}   ${title}