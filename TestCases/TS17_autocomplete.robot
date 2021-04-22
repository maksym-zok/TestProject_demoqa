*** Settings ***
Library                 BuiltIn
Library                 Collections
Library                 SeleniumLibrary
Resource                ../Bindings/keywords.robot
Resource                ../Resources/variables.robot
Test Setup              Start browser and maximaze  https://demoqa.com/auto-complete
Test Teardown           close browser

*** Test Cases ***
Check whether single color field accepts valid data
    FOR    ${res}    IN RANGE    0    8
            click element                   id:autoCompleteSingleInput
            input text                      id:autoCompleteSingleInput      ${LIST}[${res}]
            press keys                      id:autoCompleteSingleInput      ENTER
            ${color}                        get text                        //div[@class="auto-complete__single-value css-1uccc91-singleValue"]
            should be equal as strings      ${color}                        ${LIST}[${res}]
    END

Check whether single color field doesnt accept invalid data
    FOR    ${res}    IN RANGE    0    8
            click element                   id:autoCompleteSingleInput
            input text                      id:autoCompleteSingleInput      ${INVALID_COLOR}[${res}]
            press keys                      id:autoCompleteSingleInput      ENTER
            click element                   //span[text()="Type single color name"]
            ${color}                        get text                        (//div[contains(@class, 'auto-complete__value-container')])[2]/div
            should be equal as strings      ${color}                        ${EMPTY}
    END

Check whether single color field autocompletes valid words without the last letter
    FOR    ${res}    IN RANGE    0    8
            click element                   id:autoCompleteSingleInput
            input text                      id:autoCompleteSingleInput      ${LIS}[${res}]
            press keys                      id:autoCompleteSingleInput      ENTER
            ${color}                        get text                        //div[@class="auto-complete__single-value css-1uccc91-singleValue"]
            should be equal as strings      ${color}                        ${LIST}[${res}]
    END

Check whether multiple color field accepts valid data
    FOR    ${res}    IN RANGE    0    8
            input text                      id:autoCompleteMultipleInput    ${LIST}[${res}]
            press keys                      id:autoCompleteMultipleInput    ENTER
            ${res_plus_1}                   evaluate                        ${res}+1
            ${color}                        get text                        (//div[contains(@class, '-multiValue auto-complete__multi-value')])[${res_plus_1}]
            should be equal as strings      ${color}                        ${LIST}[${res}]
    END

Check whether multiple color field autocompletes valid words without the last letter
    FOR    ${res}    IN RANGE    0    8
            input text                      id:autoCompleteMultipleInput    ${LIS}[${res}]
            press keys                      id:autoCompleteMultipleInput    ENTER
            ${res_plus_1}                   evaluate                        ${res}+1
            ${color}                        get text                        (//div[contains(@class, '-multiValue auto-complete__multi-value')])[${res_plus_1}]
            should be equal as strings      ${color}                        ${LIST}[${res}]
    END

Check whether multiple color field doesnt accept invalid data
    FOR    ${res}    IN RANGE    0    8
            input text                      id:autoCompleteMultipleInput    ${INVALID_COLOR}[${res}]
            press keys                      id:autoCompleteMultipleInput    ENTER
            click element                   //span[text()='Type multiple color names']
#            validate whether the element class corresponds to an empty element class
            element attribute value should be   (//div[@id="autoCompleteMultipleContainer"]/div/div)[1]     class   auto-complete__value-container auto-complete__value-container--is-multi css-1hwfws3
    END

Check whether user is able to remove entered valid color from multiple color field
    FOR    ${res}    IN RANGE    0    8
            input text                      id:autoCompleteMultipleInput    ${LIST}[${res}]
            press keys                      id:autoCompleteMultipleInput    ENTER
            ${color}                        get text                        //div[contains(@class, '-multiValue auto-complete__multi-value')]
            should be equal as strings      ${color}                        ${LIST}[${res}]
            click element                   //div[contains(@class, 'auto-complete__multi-value__remove')]
#           validate whether the element class corresponds to an empty element class
            element attribute value should be   (//div[@id="autoCompleteMultipleContainer"]/div/div)[1]     class   auto-complete__value-container auto-complete__value-container--is-multi css-1hwfws3
    END

