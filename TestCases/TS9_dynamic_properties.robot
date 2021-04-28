*** Settings ***
Library                 BuiltIn
Library                 Collections
Library                 SeleniumLibrary
Library                 RequestsLibrary
Resource                ../Bindings/keywords.robot
Resource                ../Resources/variables.robot
Resource                ../Resources/TS9_dynamic_properties_keywords.robot
Test Setup              Start browser and maximaze  https://demoqa.com/dynamic-properties
Test Teardown           close browser

*** Test Cases ***
Check element should be enable in 5 sec
    element should be disabled              ${btn_enabled_in_5s}
    wait until element is enabled           ${btn_enabled_in_5s}  5

Check element should be visible in 5 sec
    element should not be visible           ${btn_visiable_in_5s}
    wait until element is visible           ${btn_visiable_in_5s}

Check element should change color in 5 sec
    page should not contain element         ${btn_color_change_red}
    ${element_white}                        Get CSS Property Value      ${btn_color_change_white}    color
    should be equal as strings              ${element_white}            ${white}
    wait until page contains element        ${btn_color_change_red}         5
    page should contain element             ${btn_color_change_red}
    sleep                                   1
    ${element_red}                          Get CSS Property Value      ${btn_color_change_red}    color
    should be equal as strings              ${element_red}              ${rgba_red}