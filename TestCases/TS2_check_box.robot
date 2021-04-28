*** Settings ***
Library                 BuiltIn
Library                 Collections
Library                 RequestsLibrary
Library                 SeleniumLibrary
Resource                ../Bindings/keywords.robot
Resource                ../Resources/variables.robot
Resource                ../Resources/TS2_check_box_keywords.robot
Test Setup              Start browser and maximaze  https://demoqa.com/checkbox
Test Teardown           close browser

*** Test Cases ***
Check that user is able to deploy checkbox tree unfolds
    Verify that branches are not deployed
    Deploy branches
    Verify thay branches are deployed

Check that user is able to click on unchecked checkbox
    Deploy branches
    Select random checkbox
    Verify that checkbox is selected
