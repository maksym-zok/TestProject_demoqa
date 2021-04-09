*** Settings ***

Library     Collections
Library     RequestsLibrary
*** Variables ***

*** Keywords ***

User Input valid username
    input text      id:userName                 ${valid_username}
Input valid email
    input text      id:userEmail                ${valid_email}
Input invalid email
    input text      id:userEmail                jadasd@as
Input valid current address
    input text      id:currentAddress           ${valid_cur_address}
Input valid permanent address
    input text      id:permanentAddress         ${valid_per_address}
Submit data in Text Box
    click element   id:submit
Inputted data corresponds to the data in the response
    element should contain  xpath://div[@class="border col-md-12 col-sm-12"]/p[@id="name"]    ${valid_username}
    element should contain  xpath://div[@class="border col-md-12 col-sm-12"]/p[@id="email"]    ${valid_email}
    element should contain  xpath://div[@class="border col-md-12 col-sm-12"]/p[@id="currentAddress"]    ${valid_cur_address}
    element should contain  xpath://div[@class="border col-md-12 col-sm-12"]/p[@id="permanentAddress"]    ${valid_per_address}
User is on Text Box page
    open browser    ${base_url}   ${browser}
    click element   ${elements}
    click element   ${text_box}
Inputted data should no be accepted
    element should not be visible  xpath://div[@class="border col-md-12 col-sm-12"]

Start browser and maximaze
    [Arguments]     ${url}
    open browser    ${url}   chrome
    maximize browser window
    title should be        ToolsQA
Add new record
    [Arguments]     ${firstName}    ${lastName}     ${userEmail}    ${age}  ${salary}   ${department}
    click button    id:addNewRecordButton
    input text      id:firstName    ${firstName}
    input text      id:lastName     ${lastName}
    input text      id:userEmail    ${userEmail}
    input text      id:age          ${age}
    input text      id:salary       ${salary}
    input text      id:department   ${department}
    click button    id:submit
Get CSS Property Value
    [Documentation]
    ...    Get the CSS property value of an Element.
    ...
    ...    This keyword retrieves the CSS property value of an element. The element
    ...    is retrieved using the locator.
    ...
    ...    Arguments:
    ...    - locator           (string)    any Selenium Library supported locator xpath/css/id etc.
    ...    - property_name     (string)    the name of the css property for which the value is returned.
    ...
    ...    Returns             (string)    returns the string value of the given css attribute or fails.
    ...
    [Arguments]    ${locator}    ${attribute name}
    ${css}=         Get WebElement    ${locator}
    ${prop_val}=    Call Method       ${css}    value_of_css_property    ${attribute name}
    [Return]     ${prop_val}

Open accordion
    [Arguments]     ${xpath_collapse_get}     ${click}
    ${element_accordion}=       Get CSS Property Value      ${xpath_collapse_get}    display
    ${shown}                    set variable                block
    ${hidden}                   set variable                none
    IF                         '${element_accordion}' == '${shown}'
           log to console       Accordion is shown
           ELSE IF              '${element_accordion}' == '${hidden}'
           click element        ${click}
           wait until page contains element                   ${xpath_collapse_get}
           ${element_accordion}=    Get CSS Property Value    ${xpath_collapse_get}    display
           log to console       Accordion is shown
     END
Open accordion and check that other are closed
    [Arguments]     ${xpath_collapse_get}   ${wait_xpath_collapse}     ${click}      ${xpath_collapse_check_1}   ${xpath_collapse_check_2}
    ${element_accordion}=       Get CSS Property Value      ${xpath_collapse_get}       display
    ${shown}                    set variable                block
    ${hidden}                   set variable                none
    IF                         '${element_accordion}' == '${shown}'
           log to console       Accordion is shown
           ELSE IF              '${element_accordion}' == '${hidden}'
           click element        ${click}
           wait until page contains element                 ${wait_xpath_collapse}
           ${element_accordion}=    Get CSS Property Value  ${xpath_collapse_get}       display
           log to console       Accordion is shown
     END
    ${element_accordion2}=       Get CSS Property Value     ${xpath_collapse_check_1}    display
    ${element_accordion3}=       Get CSS Property Value     ${xpath_collapse_check_2}    display
    should be equal as strings   ${element_accordion2}   ${hidden}
    should be equal as strings   ${element_accordion3}   ${hidden}
    log to console               Only one accordion is opened

Calendar navigate
    [Arguments]     ${previous}
    wait until element is visible   xpath://button[@class="react-datepicker__navigation react-datepicker__navigation--${previous}"]
    click element                   xpath://button[@class="react-datepicker__navigation react-datepicker__navigation--${previous}"]

Select month
    [Arguments]     ${month}
    select from list by label       class:react-datepicker__month-select            ${month}

Select year
    [Arguments]     ${year}
    select from list by label       class:react-datepicker__year-select             ${year}

Select day
    [Arguments]     ${day}  ${month}    ${year}
    click element                   xpath://div[@aria-label="Choose Wednesday, ${month} ${day}, ${year}"]