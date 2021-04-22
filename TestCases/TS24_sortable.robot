*** Settings ***
Library                 BuiltIn
Library                 Collections
Library                 SeleniumLibrary
Resource                ../Bindings/keywords.robot
Resource                ../Resources/variables.robot
Test Setup              Start browser and maximaze  https://demoqa.com/sortable
Test Teardown           close browser

*** Test Cases ***
Check whether user is abel to move elements up and down in List
    click element                       //a[text()='List']
    element attribute value should be   //a[text()='List']  aria-selected   true
    ${elements}     get element count   //div[@id="demo-tabpane-list"]//div[@class="list-group-item list-group-item-action"]
    FOR     ${res}  IN RANGE    1   ${elements}
        ${text1}                    get text        (//div[@id="demo-tabpane-list"]//div[@class="list-group-item list-group-item-action"])[${res}]
        ${res+1}                    evaluate        ${res}+1
        ${text2}                    get text        (//div[@id="demo-tabpane-list"]//div[@class="list-group-item list-group-item-action"])[${res+1}]
        drag and drop               //div[@id="demo-tabpane-list"]//div[text()='${text1}']  //div[@id="demo-tabpane-list"]//div[text()='${text2}']
        ${text1_after}              get text        (//div[@id="demo-tabpane-list"]//div[@class="list-group-item list-group-item-action"])[${res}]
        ${text2_after}              get text        (//div[@id="demo-tabpane-list"]//div[@class="list-group-item list-group-item-action"])[${res+1}]
        should be equal as strings  ${text1}        ${text2_after}
        should be equal as strings  ${text2}        ${text1_after}
    END
    FOR     ${res}  IN RANGE    1    ${elements}
        ${text1}                    get text        (//div[@id="demo-tabpane-list"]//div[@class="list-group-item list-group-item-action"])[${elements}]
        ${text2}                    get text        (//div[@id="demo-tabpane-list"]//div[@class="list-group-item list-group-item-action"])[${res}]
        drag and drop               //div[@id="demo-tabpane-list"]//div[text()='${text1}']  //div[@id="demo-tabpane-list"]//div[text()='${text2}']
        ${res+1}                    evaluate        ${res}+1
        ${text1_after}              get text        (//div[@id="demo-tabpane-list"]//div[@class="list-group-item list-group-item-action"])[${${res+1}}]
        ${text2_after}              get text        (//div[@id="demo-tabpane-list"]//div[@class="list-group-item list-group-item-action"])[${res}]
        should be equal as strings  ${text1}        ${text2_after}
        should be equal as strings  ${text2}        ${text1_after}
    END

Check whether user is unable to move elements out of the list
    click element                       //a[text()='List']
    element attribute value should be   //a[text()='List']  aria-selected   true
    ${elements}                         get element count   //div[@id="demo-tabpane-list"]//div[@class="list-group-item list-group-item-action"]
    ${elements+1}                       evaluate    ${elements}+1
        FOR     ${res}  IN RANGE    1   ${elements+1}
        ${text1}                    get text        (//div[@id="demo-tabpane-list"]//div[@class="list-group-item list-group-item-action"])[${res}]
        drag and drop by offset                     //div[@id="demo-tabpane-list"]//div[text()='${text1}']     600   -300
        element text should be                      (//div[@id="demo-tabpane-list"]//div[@class="list-group-item list-group-item-action"])[1]  ${text1}
        drag and drop by offset                     //div[@id="demo-tabpane-list"]//div[text()='${text1}']     -600   -300
        element text should be                      (//div[@id="demo-tabpane-list"]//div[@class="list-group-item list-group-item-action"])[1]  ${text1}
        drag and drop by offset                     //div[@id="demo-tabpane-list"]//div[text()='${text1}']     -600   300
        element text should be                      (//div[@id="demo-tabpane-list"]//div[@class="list-group-item list-group-item-action"])[${elements}]  ${text1}
        drag and drop by offset                     //div[@id="demo-tabpane-list"]//div[text()='${text1}']     600   300
        element text should be                      (//div[@id="demo-tabpane-list"]//div[@class="list-group-item list-group-item-action"])[${elements}]  ${text1}
    END

Check whether user is abel to move elements in Grid
    click element                       //a[text()='Grid']
    element attribute value should be   //a[text()='Grid']  aria-selected   true
    ${elements}     get element count   //div[@id="demo-tabpane-grid"]//div[@class="list-group-item list-group-item-action"]
    FOR     ${res}  IN RANGE    1   ${elements}
        ${text1}                    get text        (//div[@id="demo-tabpane-grid"]//div[@class="list-group-item list-group-item-action"])[${res}]
        ${res+1}                    evaluate        ${res}+1
        ${text2}                    get text        (//div[@id="demo-tabpane-grid"]//div[@class="list-group-item list-group-item-action"])[${res+1}]
        drag and drop               //div[@id="demo-tabpane-grid"]//div[text()='${text1}']  //div[@id="demo-tabpane-grid"]//div[text()='${text2}']
        ${text1_after}              get text        (//div[@id="demo-tabpane-grid"]//div[@class="list-group-item list-group-item-action"])[${res}]
        ${text2_after}              get text        (//div[@id="demo-tabpane-grid"]//div[@class="list-group-item list-group-item-action"])[${res+1}]
        should be equal as strings  ${text1}        ${text2_after}
        should be equal as strings  ${text2}        ${text1_after}
    END
    FOR     ${res}  IN RANGE    1    ${elements}
        ${text1}                    get text        (//div[@id="demo-tabpane-grid"]//div[@class="list-group-item list-group-item-action"])[${elements}]
        ${text2}                    get text        (//div[@id="demo-tabpane-grid"]//div[@class="list-group-item list-group-item-action"])[${res}]
        drag and drop               //div[@id="demo-tabpane-grid"]//div[text()='${text1}']  //div[@id="demo-tabpane-grid"]//div[text()='${text2}']
        ${res+1}                    evaluate        ${res}+1
        ${text1_after}              get text        (//div[@id="demo-tabpane-grid"]//div[@class="list-group-item list-group-item-action"])[${${res+1}}]
        ${text2_after}              get text        (//div[@id="demo-tabpane-grid"]//div[@class="list-group-item list-group-item-action"])[${res}]
        should be equal as strings  ${text1}        ${text2_after}
        should be equal as strings  ${text2}        ${text1_after}
    END

Check whether user is unable to move elements out of the grid
    click element                       //a[text()='Grid']
    element attribute value should be   //a[text()='Grid']  aria-selected   true
    ${elements}                         get element count   //div[@id="demo-tabpane-grid"]//div[@class="list-group-item list-group-item-action"]
    ${elements+1}                       evaluate    ${elements}+1
        FOR     ${res}  IN RANGE    1   ${elements+1}
        ${text1}                    get text        (//div[@id="demo-tabpane-grid"]//div[@class="list-group-item list-group-item-action"])[${res}]
        drag and drop by offset                     //div[@id="demo-tabpane-grid"]//div[text()='${text1}']     600   -300
        element text should be                      (//div[@id="demo-tabpane-grid"]//div[@class="list-group-item list-group-item-action"])[1]  ${text1}
        drag and drop by offset                     //div[@id="demo-tabpane-grid"]//div[text()='${text1}']     -300   -300
        element text should be                      (//div[@id="demo-tabpane-grid"]//div[@class="list-group-item list-group-item-action"])[1]  ${text1}
        drag and drop by offset                     //div[@id="demo-tabpane-grid"]//div[text()='${text1}']     -300   300
        element text should be                      (//div[@id="demo-tabpane-grid"]//div[@class="list-group-item list-group-item-action"])[${elements}]  ${text1}
        drag and drop by offset                     //div[@id="demo-tabpane-grid"]//div[text()='${text1}']     300   300
        element text should be                      (//div[@id="demo-tabpane-grid"]//div[@class="list-group-item list-group-item-action"])[${elements}]  ${text1}
    END