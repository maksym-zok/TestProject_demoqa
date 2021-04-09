*** Settings ***
Library                 BuiltIn
Library                 Collections
Library                 SeleniumLibrary
Resource                ../Bindings/keywords.robot
Resource                ../Resources/variables.robot
Test Setup              Start browser and maximaze  https://demoqa.com/webtables
Test Teardown           close browser

*** Test Cases ***
Check whether table search works
    ${path_first_name_of_list}          set variable        xpath:(//div[@class="rt-tr -odd"]/div[@class="rt-td"])[1]
    ${first_name_of_list}               get text            ${path_first_name_of_list}
    input text                          id:searchBox        ${first_name_of_list}
    element should contain  ${path_first_name_of_list}     ${first_name_of_list}

Check whether user able to add valid data to table
    Add new record          ${id:firstName}    ${id:lastName}     ${id:userEmail}    ${id:age}  ${id:salary}   ${id:department}
    element text should be  //div[@class='rt-tr-group']/div/div[starts-with(.,'${id:firstName}')]   ${id:firstName}

Check whether user not be able to add invalid data to table
    Add new record  ${id:firstName}    ${id:lastName}     ${id:userEmail}    ${invalid_age}  ${id:salary}   ${id:department}
    element should be visible   //div[@class="modal-body"]

Check whether user able to delete user from table
    Add new record  ${id:firstName}    ${id:lastName}     ${id:userEmail}    ${id:age}  ${id:salary}   ${id:department}
    click element   //div[@class='rt-tr-group']/div/div[starts-with(.,'${id:firstName}')]/../div[@class="rt-td"]/div/span[@title="Delete"]
    page should not contain element     //div[@class='rt-tr-group']/div/div[starts-with(.,'${id:firstName}')]

Check whether user able to edit user data in table
    Add new record  ${id:firstName}    ${id:lastName}     ${id:userEmail}    ${id:age}  ${id:salary}   ${id:department}
    click element   //div[@class='rt-tr-group']/div/div[starts-with(.,'${id:firstName}')]/../div[@class="rt-td"]/div/span[@title="Edit"]
    input text      id:firstName    ${id:firstName_edited}
    click button    id:submit
    page should not contain element     //div[@class='rt-tr-group']/div/div[starts-with(.,'${id:firstName}')]
    page should contain element     //div[@class='rt-tr-group']/div/div[starts-with(.,'${id:firstName_edited}')]

Check whether user is not able to add user with existing info
    Add new record  ${id:firstName}    ${id:lastName}     ${id:userEmail}    ${id:age}  ${id:salary}   ${id:department}
    Add new record  ${id:firstName}    ${id:lastName}     ${id:userEmail}    ${id:age}  ${id:salary}   ${id:department}
    page should contain element         (//div[@class='rt-tr-group']/div/div[starts-with(.,'${id:firstName}')])[1]
    page should not contain element     (//div[@class='rt-tr-group']/div/div[starts-with(.,'${id:firstName}')])[2]

Check whether user is able to turn the pages of the web table when the table has more than 10 rows
    element should be disabled   //div[@class="-next"]/*[text() = 'Next']
    element should be disabled    //div[@class="-previous"]/*[text() = 'Previous']
    FOR    ${res}    IN RANGE  1     11
           Add new record  ${id:firstName}    ${id:lastName}     ${id:userEmail}    ${id:age}  ${id:salary}   ${id:department}
    END
    element should be enabled   //div[@class="-next"]/*[text() = 'Next']
    click button    //div[@class="-next"]/*[text() = 'Next']
    element should be enabled   //div[@class="-previous"]/*[text() = 'Previous']
    click button    //div[@class="-previous"]/*[text() = 'Previous']

Check whether user is able to turn the pages of the web table using input field
    element should be disabled   //div[@class="-next"]/*[text() = 'Next']
    element should be disabled    //div[@class="-previous"]/*[text() = 'Previous']
    FOR    ${res}    IN RANGE  1     20
           Add new record  ${id:firstName}    ${id:lastName}     ${id:userEmail}    ${id:age}  ${id:salary}   ${id:department}
    END
    ${number_of_pages}  get text    //span[@class="-totalPages"]
    input text  //input[@aria-label="jump to page"]     ${number_of_pages}
    press keys  //input[@aria-label="jump to page"]     ENTER
    element attribute value should be   //input[@aria-label="jump to page"]     value   ${number_of_pages}

Check whether user is not able to turn the pages of the web table when the table has less than 10 rows
    FOR    ${res}    IN RANGE  1     6
           Add new record  ${id:firstName}    ${id:lastName}     ${id:userEmail}    ${id:age}  ${id:salary}   ${id:department}
    END
    element should be disabled   //div[@class="-next"]/*[text() = 'Next']
    element should be disabled   //div[@class="-previous"]/*[text() = 'Previous']

Check whether user is able to select the number of rows per page
    page should contain list            //select[@aria-label="rows per page"]
    FOR    ${res}    IN     5  10  20  25  50  100
            select from list by value           //select[@aria-label="rows per page"]   ${res}
            ${count}        get element count   //div[@class="rt-tr-group"]
            ${res}          convert to integer  ${res}
            should be equal     ${res}  ${count}
    END

Check whether user information is added to the end of the list
    Add new record  ${id:firstName}    ${id:lastName}     ${id:userEmail}    ${id:age}  ${id:salary}   ${id:department}
    ${count}    get element count   (//div[@class='rt-tr-group'])
    ${count}    convert to integer  ${count}
    FOR    ${res}    IN RANGE     1  ${count}
            ${text}     get text    (//div[@class='rt-tr-group'])[${res}]/div[@role="row"]/div[1]
            exit for loop if    '${text}' == '${id:firstName}'
    END
    ${res}  evaluate    ${res}+1
    element should contain  (//div[@class='rt-tr-group'])[${res}]/div[@role="row"]/div[1]   ${EMPTY}