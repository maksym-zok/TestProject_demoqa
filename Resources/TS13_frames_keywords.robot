*** Settings ***
Library                 SeleniumLibrary
Variables               ../PageObjects/Locators.py

*** Keywords ***
Count frames
    ${frames}   get element count   ${win_frames}
    set global variable  ${frames}

Verify number of frames
    [Arguments]  ${frames}  ${exp_frames}
    should be equal as integers     ${frames}   ${exp_frames}
