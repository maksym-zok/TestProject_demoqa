*** Settings ***
Library                 BuiltIn
Library                 Collections
Library                 SeleniumLibrary
Resource                ../Bindings/keywords.robot
Resource                ../Resources/variables.robot
Resource                ../Resources/TS17_autocomplete_keywords.robot
Test Setup              Start browser and maximaze  https://demoqa.com/auto-complete
Test Teardown           close browser

*** Test Cases ***
Check whether single color field accepts valid data
    FOR    ${res}    IN RANGE    0    8
            Enter color to single field     ${LIST}[${res}]
            Verify valid color              ${output_single_color}  ${LIST}[${res}]
    END

Check whether single color field doesnt accept invalid data
    FOR    ${res}    IN RANGE    0    8
            Enter color to single field     ${INVALID_COLOR}[${res}]
            Verify empty color fiel         ${output_single_color}
    END

Check whether single color field autocompletes valid words without the last letter
    FOR    ${res}    IN RANGE    0    8
            Enter color to single field     ${LIS}[${res}]
            Verify valid color              ${output_single_color}  ${LIST}[${res}]
    END

Check whether multiple color field accepts valid data
    FOR    ${res}    IN RANGE    0    8
            set global variable             ${res}
            Enter color to multiple field   ${LIST}[${res}]
            Verify valid colors             ${LIST}[${res}]
    END

Check whether multiple color field autocompletes valid words without the last letter
    FOR    ${res}    IN RANGE    0    8
            set global variable             ${res}
            Enter color to multiple field   ${LIS}[${res}]
            Verify valid colors             ${LIST}[${res}]
    END

Check whether multiple color field doesnt accept invalid data
    FOR    ${res}    IN RANGE    0    8
            Enter color to multiple field   ${INVALID_COLOR}[${res}]
            Verify empty color field        ${output_multiple_colors}
    END

Check whether user is able to remove entered valid color from multiple color field
    Enter color to multiple field           ${LIST}[1]
    Verify valid color                      ${output_multiple_colors}   ${LIST}[1]
    Delete color
    Verify empty color field                ${output_multiple_colors}

