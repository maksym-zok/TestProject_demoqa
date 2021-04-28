*** Settings ***
Library                 BuiltIn
Library                 Collections
Library                 RequestsLibrary
Library                 SeleniumLibrary
Resource                ../Bindings/keywords.robot
Resource                ../Resources/variables.robot
Resource                ../Resources/TS3_radio_button_keywords.robot
Test Setup              Start browser and maximaze  https://demoqa.com/radio-button
Test Teardown           close browser

*** Test Cases ***
Checking whether YES radio button is clickable
    click element               ${radio_button_yes}
    Verify that element is clicked on  Yes

Checking whether IMPRESSIVE radio button is clickable
    click element               ${radio_button_impressive}
    Verify that element is clicked on  Impressive

Checking whether NO radio button is clickable
    click element               ${radio_button_no}
    Verify that element is not clicked