*** Settings ***
Library                 BuiltIn
Library                 Collections
Library                 RequestsLibrary
Library                 SeleniumLibrary
Resource                ../Bindings/keywords.robot
Resource                ../Resources/variables.robot
Resource                ../Resources/TS12_alerts_keywords.robot
Test Setup              Start browser and maximaze  https://demoqa.com/alerts
Test Teardown           close browser

*** Test Cases ***
Check whether button opens allert message
    click button                ${btn_alert}
    alert should be present     You clicked a button                    ACCEPT

Check whether button opens allert message with delay 5s
    click button                ${btn_time_alert}
    sleep                       5
    alert should be present     This alert appeared after 5 seconds     ACCEPT

Check whether button opens allert message with confirmation
    click button                ${btn_confirmation}
    alert should be present     Do you confirm action?                  ACCEPT
    element should contain      ${output_confirm_res}                   You selected    OK

Check whether button opens allert message with input field
    click button                ${btn_promt}
    input text into alert       ${valid_username}                       ACCEPT
    element should contain      ${output_promt_res}                     You entered    ${valid_username}