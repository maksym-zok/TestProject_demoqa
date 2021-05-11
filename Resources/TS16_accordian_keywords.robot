*** Settings ***
Library                 BuiltIn
Library                 Collections
Library                 SeleniumLibrary
Variables               ../PageObjects/Locators.py

*** Keywords ***
Open accordion
    [Arguments]     ${xpath_collapse_get}     ${click}
    ${element_accordion}=       Get CSS Property Value      ${xpath_collapse_get}    display
    IF                         '${element_accordion}' == '${shown}'
           set variable         ${shown}
           ELSE IF              '${element_accordion}' == '${hidden}'
           click element        ${click}
           wait until page contains element                   ${xpath_collapse_get}
     END
     set global variable    ${element_accordion}
Verify that accordion is opened
    [Arguments]  ${xpath_collapse_get}
    wait until page contains element                   ${xpath_collapse_get}
    ${element_accordion}=    Get CSS Property Value    ${xpath_collapse_get}    display
    should be equal as strings  ${element_accordion}   ${shown}

Verify that accordion is closed
    [Arguments]  ${xpath_collapse_get}
    wait until page contains element                   ${xpath_collapse_get}
    ${element_accordion}=    Get CSS Property Value    ${xpath_collapse_get}    display
    should be equal as strings  ${element_accordion}   ${hidden}