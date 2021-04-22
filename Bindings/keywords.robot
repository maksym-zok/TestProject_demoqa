*** Settings ***
Library                 BuiltIn
Library                 RequestsLibrary
Library                 String
Library                 Collections
Library                 SeleniumLibrary
Library                 JSONLibrary
Library                 String
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

Select days
    [Arguments]     ${day}  ${month}    ${year}
    click element                   //div[contains(@aria-label, '${month} ${day}, ${year}')]

Clear Field Of Characters
    [Arguments]    ${field}    ${character count}
    FOR    ${index}    IN RANGE    ${character count}
        Press Keys    ${field}  BACKSPACE
    END

Clear rowField Of Characters
    [Arguments]    ${field}    ${character count}
    FOR    ${index}    IN RANGE    ${character count}
        Press Keys    ${field}  DELETE
    END

Send element to
    [Arguments]     ${locator}   ${x}   ${y}
    ${element_before_left_position}        Get CSS Property Value          ${locator}           left
    ${element_before_top_position}        Get CSS Property Value          ${locator}           top
#    log to console                      ${element_before_position}
#    should be equal as strings          ${element_before_left_position}    0px
#    should be equal as strings          ${element_before_top_position}    0px
    drag and drop by offset                     ${locator}     ${x}   ${y}

Validate the element position
    [Arguments]     ${locator}   ${x}   ${y}
    ${element_after_left_position}        Get CSS Property Value          ${locator}           left
    ${element_after_top_position}        Get CSS Property Value           ${locator}           top
    should be equal as strings          ${element_after_left_position}    ${x}px
    should be equal as strings          ${element_after_top_position}    ${y}px

Validation of an element with invalid expected result
    [Arguments]     ${locator}   ${x}   ${y}
    ${element_after_left_position}        Get CSS Property Value          ${locator}           left
    ${element_after_top_position}        Get CSS Property Value           ${locator}           top
    should not be equal as strings          ${element_after_left_position}    ${x}px
    should not be equal as strings          ${element_after_top_position}    ${y}px

Login
    [Arguments]    ${username}    ${password}
    input text                  id:userName                     ${username}
    input text                  id:password                     ${password}
    click button                id:login
    wait until page contains element                            //div[@class="main-header" and text()="Profile"]

Logining deleted user
    [Arguments]    ${username}    ${password}
    input text                  id:userName                     ${username}
    input text                  id:password                     ${password}
    click button                id:login

Authorization and deleting collection
    [Arguments]         ${username}  ${password}    ${userid}
    ${auth}=            create list        ${username}  ${password}
    &{data}=            Create Dictionary  UserId=${userid}
    create session      registration       https://demoqa.com     auth=${auth}
    ${header}           Create dictionary        Content-Type=application/json
    ${response}         DELETE On Session             registration    BookStore/v1/Books  params=${data}
    log to console      ${response.status_code}
    log to console      ${response.content}
    log to console      ${response.headers}

Authorization
    [Arguments]         ${username}  ${password}    ${userid}
    ${auth}=            create list        ${username}  ${password}
    &{data}=            Create Dictionary  UserId=${userid}
    create session      registration       https://demoqa.com     auth=${auth}

Creating account and authorization
    [Arguments]          ${deleted_username}  ${deleted_pass}
    create session      user_registration       https://demoqa.com
    ${header}           Create dictionary        Content-Type=application/json
    ${response}         post request             user_registration    Account/v1/User   data={"userName": "${deleted_username}", "password": "${deleted_pass}"}    headers=${header}
    ${userid}           get value from json  ${response.json()}  $.userID
    ${auth}             create list        ${deleted_username}  ${deleted_pass}
    &{data}             Create Dictionary  UserId=${userid}
    create session      registration       https://demoqa.com     auth=${auth}

Creating and deleting account
    [Arguments]          ${deleted_username}  ${deleted_pass}
    create session      user_registration       https://demoqa.com
    ${header}           Create dictionary        Content-Type=application/json
    ${response}         POST On Session             user_registration    Account/v1/User   data={"userName": "${deleted_username}", "password": "${deleted_pass}"}    headers=${header}
    ${userid}           get value from json  ${response.json()}  $.userID
    log to console      ${response.status_code}
    log to console      ${response.json()}
    log to console      ${response.headers}
    ${auth}             create list        ${deleted_username}  ${deleted_pass}
    create session      deleting      https://demoqa.com     auth=${auth}
    ${response}         DELETE On Session             deleting    Account/v1/User/${userid[0]}

Authorization and adding books to collection
    [Arguments]         ${username}  ${password}    ${userid}
    ${auth}=            create list        ${username}  ${password}
    &{data}=            Create Dictionary  UserId=${userid}
    create session      authorization       https://demoqa.com     auth=${auth}
    ${header}           Create dictionary        Content-Type=application/json
    ${getresponse}      GET On Session      authorization  BookStore/v1/Books
    ${isbn}             get value from json  ${getresponse.json()}  $.books.[*].isbn
    ${count_isbn}       Get Length  ${isbn}
    log to console      ${count_isbn}
    log to console      ${isbn}
    create session      user_registration       https://demoqa.com
    ${header}           Create dictionary        Content-Type=application/json
    FOR  ${res}  IN RANGE  0  ${count_isbn}
        ${postresponse}         POST On Session             authorization    BookStore/v1/Books  data={"userId":"${userid}","collectionOfIsbns":[{"isbn":"${isbn[${res}]}"}]}   headers=${header}
    END