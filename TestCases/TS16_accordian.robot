*** Settings ***
Library                 BuiltIn
Library                 Collections
Library                 SeleniumLibrary
Resource                ../Bindings/keywords.robot
Resource                ../Resources/variables.robot
Resource                ../Resources/TS16_accordian_keywords.robot
Test Setup              Start browser and maximaze  https://demoqa.com/accordian
Test Teardown           close browser

*** Test Cases ***
Сheck whether the accordions can be opened
    FOR  ${res}  IN RANGE   1  4
        Open accordion  ${XPATH_COLLAPSE_CHECK}[${res}]   ${BTN_ACCORDIAN}[${res}]
        Verify that accordion is opened  ${XPATH_COLLAPSE_CHECK}[${res}]
    END

Check that the other accordians are closed when one is opened
    Open accordion  ${XPATH_COLLAPSE_CHECK}[1]   ${BTN_ACCORDIAN}[1]
    Verify that accordion is opened  ${XPATH_COLLAPSE_CHECK}[1]
    Verify that accordion is closed  ${XPATH_COLLAPSE_CHECK}[2]
    Verify that accordion is closed  ${XPATH_COLLAPSE_CHECK}[3]