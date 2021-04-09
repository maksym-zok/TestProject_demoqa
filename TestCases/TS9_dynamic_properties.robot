*** Settings ***
Library                 BuiltIn
Library                 Collections
Library                 SeleniumLibrary
Library                 RequestsLibrary
Resource                ../Bindings/keywords.robot
Resource                ../Resources/variables.robot
Library                 ../Resources/keywordlib.py
Test Setup              Start browser and maximaze  https://demoqa.com/dynamic-properties
Test Teardown           close browser

*** Test Cases ***
Check element should be enable in 5 sec
    element should be disabled              id:enableAfter
    wait until element is enabled           id:enableAfter  5

Check element should be visible in 5 sec
    element should not be visible           id:visibleAfter
    wait until element is visible           id:visibleAfter

Check element should change color in 5 sec
    page should not contain element         //button[@class="mt-4 text-danger btn btn-primary"]
    ${element_white}=                       Get CSS Property Value    id=colorChange    color
    ${white}                                set variable     rgba(255, 255, 255, 1)
     IF    '${element_white}' == '${white}'
           Log To Console                   Font color is WHITE
     END
    wait until page contains element        //button[@class="mt-4 text-danger btn btn-primary"]     5
    page should contain element             //button[@class="mt-4 text-danger btn btn-primary"]
    ${element_red}=                         Get CSS Property Value    id=colorChange    color
    ${red}                                  set variable     rgba(220, 53, 69, 1)
     IF    '${element_red}' == '${red}'
           Log To Console                   Font color changed to RED
     END