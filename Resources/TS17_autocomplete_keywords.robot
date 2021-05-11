*** Settings ***
Library                 BuiltIn
Library                 Collections
Library                 SeleniumLibrary
Variables               ../PageObjects/Locators.py

*** Keywords ***
Enter color to single field
    [Arguments]  ${color}
    click element                   ${txt_single_color}
    input text                      ${txt_single_color}  ${color}
    press keys                      ${txt_single_color}  ENTER
    click element                   ${div_to_click}

Verify valid color
    [Arguments]  ${output}  ${inputed_color}
    ${color}                        get text   ${output}
    wait until page contains element           ${output}
    should be equal as strings      ${color}   ${inputed_color}

Verify empty color field
    [Arguments]  ${output}
    page should not contain element     ${output}

Enter color to multiple field
    [Arguments]  ${color}
    click element                   ${txt_multiple_colors}
    input text                      ${txt_multiple_colors}  ${color}
    press keys                      ${txt_multiple_colors}  ENTER
    click element                   ${div_to_click}
Verify valid colors
    [Arguments]  ${inputed_color}
    ${res_plus_1}                   evaluate                        ${res}+1
    ${color}                        get text   (${output_multiple_colors})[${res_plus_1}]

Delete color
    click element                   ${btn_remove}