*** Settings ***
Library                 BuiltIn
Library                 Collections
Library                 RequestsLibrary
Library                 SeleniumLibrary
Resource        ../Bindings/keywords.robot
Resource        ../Resources/variables.robot
Test Setup              Start browser and maximaze  https://demoqa.com/radio-button
Test Teardown           close browser

*** Test Cases ***
Checking whether YES radio button is clickable
    click element               xpath://*[@for="yesRadio"]
    element should contain      xpath://*[@class="mt-3"]  Yes

Checking whether IMPRESSIVE radio button is clickable
    click element               xpath://*[@for="impressiveRadio"]
    element should contain      xpath://*[@class="mt-3"]  Impressive

Checking whether NO radio button is clickable
    click element               xpath://*[@for="noRadio"]
    radio button should not be selected     like