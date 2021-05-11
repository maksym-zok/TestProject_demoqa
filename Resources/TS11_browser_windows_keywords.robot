*** Settings ***
Library                 SeleniumLibrary
Variables               ../PageObjects/Locators.py

*** Keywords ***
Verify tabs
    [Arguments]  ${tab1}  ${tab2}
    should not be equal             ${tab1}  ${tab2}

Verify windows
    [Arguments]  ${window1}  ${window2}
    should not be equal             ${window1}  ${window2}