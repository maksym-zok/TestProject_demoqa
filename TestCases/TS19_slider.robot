*** Settings ***
Library                 BuiltIn
Library                 Collections
Library                 SeleniumLibrary
Resource                ../Bindings/keywords.robot
Resource                ../Resources/variables.robot
Test Setup              Start browser and maximaze  https://demoqa.com/slider
Test Teardown           close browser

*** Test Cases ***
Check whether user is able to change the position of the slider
    ${pre_value}                get value   //input[@class="range-slider range-slider--primary"]
    drag and drop by offset     //input[@class="range-slider range-slider--primary"]    6   0
    ${current_value}            get value   //input[@class="range-slider range-slider--primary"]
    should not be equal         ${pre_value}    ${current_value}

Check whether user is able to change the position of the slider to 100 %
    ${100_value}                set variable    100
    drag and drop by offset     //input[@class="range-slider range-slider--primary"]    325   0
    ${current_value}            get value   //input[@class="range-slider range-slider--primary"]
    should be equal             ${100_value}    ${current_value}

Check whether user is able to change the position of the slider to 0 %
    ${0_value}                set variable    0
    drag and drop by offset     //input[@class="range-slider range-slider--primary"]    -325   0
    ${current_value}            get value   //input[@class="range-slider range-slider--primary"]
    should be equal             ${0_value}    ${current_value}

Check whether user is unable to change the position of the slider to over 100 %
    ${100_value}                set variable    100
    drag and drop by offset     //input[@class="range-slider range-slider--primary"]    425   0
    ${current_value}            get value   //input[@class="range-slider range-slider--primary"]
    should be equal             ${100_value}    ${current_value}

Check whether user is unable to change the position of the slider to less than 0 %
    ${0_value}                set variable    0
    drag and drop by offset     //input[@class="range-slider range-slider--primary"]    -425   0
    ${current_value}            get value   //input[@class="range-slider range-slider--primary"]
    should be equal             ${0_value}    ${current_value}