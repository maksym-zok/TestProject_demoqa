*** Settings ***
Library                 BuiltIn
Library                 Collections
Library                 SeleniumLibrary
Resource                ../Bindings/keywords.robot
Resource                ../Resources/variables.robot
Test Setup              Start browser and maximaze  https://demoqa.com/buttons
Test Teardown           close browser

*** Test Cases ***
Check whether "Double click me" button accepts double click
    double click element            id:doubleClickBtn
    element should contain          id:doubleClickMessage   You have done a double click

Check whether "Double click me" button doesnt accept misclick
    open context menu               id:doubleClickBtn
    element should not be visible   id:doubleClickMessage

Check whether "Right click me" button accepts context menu click
    open context menu               id:rightClickBtn
    element should contain          id:rightClickMessage    You have done a right click

Check whether "Right click me" button doesnt accept misclick
    click element                   id:rightClickBtn
    element should not be visible   id:rightClickMessage

Check whether "Click me" button accepts left mouse button click
    click button                    xpath://*[text()='Click Me']
    element should contain          id:dynamicClickMessage  You have done a dynamic click

Check whether "Click me" button doesnt accept misclick
    open context menu               xpath://*[text()='Click Me']
    element should not be visible   id:dynamicClickMessage