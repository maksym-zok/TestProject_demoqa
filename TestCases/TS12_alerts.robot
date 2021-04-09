*** Settings ***
Library                 BuiltIn
Library                 Collections
Library                 RequestsLibrary
Library                 SeleniumLibrary
Resource                ../Bindings/keywords.robot
Resource                ../Resources/variables.robot
Test Setup              Start browser and maximaze  https://demoqa.com/alerts
Test Teardown           close browser

*** Test Cases ***
Check whether button opens allert message
    click button    id:alertButton
    alert should be present     You clicked a button    ACCEPT

Check whether button opens allert message with delay 5s
    click button    id:timerAlertButton
    sleep           5
    alert should be present     This alert appeared after 5 seconds     ACCEPT

Check whether button opens allert message with confirmation
    click button    id:confirmButton
    alert should be present     Do you confirm action?     ACCEPT
    element should contain  id:confirmResult     You selected    OK

Check whether button opens allert message with input field
    click button    id:promtButton
    input text into alert       Max     action=ACCEPT
    element should contain  id:promptResult     You entered    Max