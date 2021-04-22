*** Settings ***
Library                 BuiltIn
Library                 RequestsLibrary
Library                 String
Library                 Collections
Library                 SeleniumLibrary
Library                 JSONLibrary
Library                 String
Resource                ../Bindings/keywords.robot
Resource                ../Resources/variables.robot
Test Setup              Start browser and maximaze  https://demoqa.com/text-box
Test Teardown           close all browsers

*** Test Cases ***
Check that all items of the menu are clickable
    ${elements_number}                              get element count       //div[@class="element-group"]
    ${elements_number}          evaluate        ${elements_number}+1
    FOR  ${res}  IN RANGE  1  ${elements_number}
        click element               (//div[@class="element-group"])[${res}]
        wait until page contains element    (//div[@class="element-group"])[${res}]/div[@class="element-list collapse show"]
        execute javascript          window.scrollTo(0,document.body.scrollHeight)
        ${li_number}                get element count           (//div[@class="element-group"])[${res}]//li
        FOR  ${ress}  IN RANGE  ${res}  ${li_number}
            click element           ((//div[@class="element-group"])[${res}]//li)[${ress}]
            execute javascript          window.scrollTo(0,document.body.scrollHeight)
            ${li_text}              get text        ((//div[@class="element-group"])[${res}]//li)[${ress}]/span
            ${header_text}          get text        //div[@class="main-header"]
            should be equal as strings          ${li_text}  ${header_text}
        END
    END

Сheck that the lower menu item is visible when you expand the items above
    ${elements_number}                              get element count       //div[@class="element-group"]
    FOR  ${res}  IN RANGE  1  ${elements_number}
        click element               (//div[@class="element-group"])[${res}]
        wait until page contains element    (//div[@class="element-group"])[${res}]/div[@class="element-list collapse show"]
        execute javascript          window.scrollTo(0,document.body.scrollHeight)
        click element               (//div[@class="element-group"])[${elements_number}]
    END