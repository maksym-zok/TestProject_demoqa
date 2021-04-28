*** Settings ***
Library                 BuiltIn
Library                 Collections
Library                 SeleniumLibrary
Resource                ../Bindings/keywords.robot
Resource                ../Resources/variables.robot
Resource                ../Resources/TS5_buttons_keywords.robot
Test Setup              Start browser and maximaze  https://demoqa.com/buttons
Test Teardown           close browser

*** Test Cases ***
Check whether "Double click me" button accepts double click
    double click element                ${btn_double}
    Verify message after double click   ${msg_double}

Check whether "Double click me" button doesnt accept misclick
    open context menu                   ${btn_double}
    Verify misclick                     ${btn_double_message}

Check whether "Right click me" button accepts context menu click
    open context menu                   ${btn_context}
    Verify message after right click    ${msg_context}

Check whether "Right click me" button doesnt accept misclick
    click element                       ${btn_context}
    Verify misclick                     ${btn_context_message}

Check whether "Click me" button accepts left mouse button click
    click button                        ${btn_one_click}
    Verify message after left click     ${msg_one_click}

Check whether "Click me" button doesnt accept misclick
    open context menu                   ${btn_one_click}
    Verify misclick                     ${btn_one_click_message}