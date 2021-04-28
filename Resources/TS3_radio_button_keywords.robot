*** Settings ***
Library                 SeleniumLibrary
Library                 BuiltIn
Variables               ../PageObjects/Locators.py

*** Keywords ***
Verify that element is clicked on
    [Arguments]     ${yes_no_impr}
    element should contain      ${output_radio}  ${yes_no_impr}

Verify that element is not clicked
    page should not contain element      ${output_radio}



#
#
#Take a name of a third user
#    ${searched_name_of_list}  get text  ${third_nameofthelist_in_the_table}
#    set global variable       ${searched_name_of_list}
#
#Enter searched name
#    [Arguments]     ${searched_name}
#    input text                 ${text_search}        ${searched_name}
#
#Verify the first item
#    [Arguments]     ${searched_name}
#    element should contain  ${first_nameofthelist_in_the_table}     ${searched_name}
#
#Click on ADD
#    wait until page contains element    ${btn_new_record}
#    click element    ${btn_new_record}
#
#Enter First name
#    [Arguments]  ${username}
#    input text  ${txt_firstname}  ${username}
#
#Enter Last name
#    [Arguments]  ${lastname}
#    input text  ${txt_lastname}  ${lastname}
#
#Enter user email
#    [Arguments]  ${email}
#    input text  ${txt_userEmail}  ${email}
#Enter user age
#    [Arguments]  ${age}
#    input text  ${txt_userage}  ${age}
#
#Enter user salary
#    [Arguments]  ${salary}
#    input text  ${txt_usersalary}  ${salary}
#
#Enter user department
#    [Arguments]  ${department}
#    input text  ${txt_userdepartment}  ${department}
#
#Click Submit
#    click button    ${btn_submitnewrecord}
#
#Verify presence of
#    [Arguments]  ${id:firstName}
#    element text should be  //div[@class='rt-tr-group']/div/div[starts-with(.,'${id:firstName}')]   ${id:firstName}
#
#Verify absence of
#    [Arguments]  ${id:firstName}
#    page should not contain element  //div[@class='rt-tr-group']/div/div[starts-with(.,'${id:firstName}')]
#Verify absence of second
#    [Arguments]  ${id:firstName}
#    page should not contain element     (//div[@class='rt-tr-group']/div/div[starts-with(.,'${id:firstName}')])[2]
#Check presence of
#    [Arguments]  ${element}
#    page should contain element  ${element}
#
#Click
#    [Arguments]  ${btn}
#    wait until page contains element    ${btn}
#    click element   ${btn}
#Edit user
#    [Arguments]     ${id:firstName}
#    click element   //div[@class='rt-tr-group']/div/div[starts-with(.,'${id:firstName}')]/../div[@class="rt-td"]/div/span[@title="Edit"]
#Delete user
#    [Arguments]     ${id:firstName}
#    click element   //div[@class='rt-tr-group']/div/div[starts-with(.,'${id:firstName}')]/../div[@class='rt-td']/div/span[@title='Delete']
#
#Clean Field Of Characters
#    [Arguments]    ${field}
#    ${field text}=                  Get Value       ${field}
#    ${field text length}=           Get Length      ${field text}
#    FOR    ${index}    IN RANGE    ${field text length}
#        Press Keys    ${field}  BACKSPACE
#    END
#
#Verify that Next and Previous buttons are disabled
#    element should be disabled      ${btn_next}
#    element should be disabled      ${btn_previous}
#
#Verify that button is disabled
#    [Arguments]     ${btn}
#    element should be disabled      ${btn}
#
#Verify that button is enabled
#    [Arguments]     ${btn}
#    element should be enabled      ${btn}
#
#Add multiple records
#    [Arguments]  ${number}
#    FOR    ${res}    IN RANGE  1     ${number}
#            Click on ADD
#            Enter First name        ${id:firstName}
#            Enter Last name         ${id:lastName}
#            Enter user email        ${id:userEmail}
#            Enter user age          ${id:age}
#            Enter user salary       ${id:salary}
#            Enter user department   ${id:department}
#            Click Submit
#    END
#
#Move to last page
#    ${number_of_pages}  get text        ${last_page}
#    input text  ${input_jump_to_page}   ${number_of_pages}
#    press keys  ${input_jump_to_page}   ENTER
#    set global variable                 ${number_of_pages}
#
#Verify page number
#    element attribute value should be   ${input_jump_to_page}     value   ${number_of_pages}
#
#Verify presence of the selector
#    page should contain list            ${rows_selector}
#
#Select multiple value from selector and verify
#    [Documentation]
#    ...     The only values that user can pick - 5  10  20  25  50  100
#    FOR    ${res}    IN     5  10  20  25  50  100
#            select from list by value           //select[@aria-label="rows per page"]   ${res}
#            ${count}        get element count   //div[@class="rt-tr-group"]
#            ${res}          convert to integer  ${res}
#            should be equal     ${res}  ${count}
#    END
#
#Count the items of the table
#    [Arguments]  ${number_of_items}
#    ${count}    get element count   ${number_of_items}
#    ${count}    convert to integer  ${count}
#    set global variable             ${count}
#
#Check that the item is added to the end of the list
#    [Arguments]  ${id:firstName}
#    FOR    ${res}    IN RANGE     1  ${count}
#            ${text}     get text    (//div[@class='rt-tr-group'])[${res}]/div[@role="row"]/div[1]
#            exit for loop if    '${text}' == '${id:firstName}'
#    END
#    ${res}  evaluate    ${res}+1
#    element should contain  (//div[@class='rt-tr-group'])[${res}]/div[@role="row"]/div[1]   ${EMPTY}