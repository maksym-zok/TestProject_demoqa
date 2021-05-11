*** Settings ***
Library                 BuiltIn
Library                 Collections
Library                 SeleniumLibrary
Resource                ../Bindings/keywords.robot
Resource                ../Resources/variables.robot
Resource                ../Resources/TS19_slider_keywords.robot
Test Setup              Start browser and maximaze  https://demoqa.com/slider
Test Teardown           close browser

*** Test Cases ***
Check whether user is able to change the position of the slider
    Move the slider along X by pixels       ${move_to_51%}
    Verify slider position after offset     ${51%_value}

Сheck that the slider value matches the slider counter
    Move the slider along X by pixels       ${move_to_51%}
    ${current_counter_value}    get value   ${output_counter}
    Verify slider position after offset     ${current_counter_value}

Check whether user is able to change the position of the slider to 100 %
    Move the slider along X by pixels       ${move_to_100%}
    Verify slider position after offset     ${100%_value}

Check whether user is able to change the position of the slider to 0 %
    Move the slider along X by pixels       ${move_to_0%}
    Verify slider position after offset     ${0%_value}

Check whether user is unable to change the position of the slider to over 100 %
    Move the slider along X by pixels       ${move_above_100%}
    Verify slider position after offset     ${100%_value}

Check whether user is unable to change the position of the slider to less than 0 %
    Move the slider along X by pixels       ${move_below_0%}
    Verify slider position after offset     ${0%_value}