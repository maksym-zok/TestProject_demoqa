*** Settings ***
Library                 BuiltIn
Library                 Collections
Library                 SeleniumLibrary
Resource                ../Bindings/keywords.robot
Resource                ../Resources/variables.robot
Resource                ../Resources/TS4_web_tables_keywords.robot
Test Setup              Start browser and maximaze  https://demoqa.com/webtables
Test Teardown           close browser

*** Test Cases ***
check whether the search engine is searching the items in the table
    Take a name of a third user
    Enter searched name     ${searched_name_of_list}
    Verify the first item   ${searched_name_of_list}

Check whether user able to add valid data to table
    Click on ADD
    Enter First name        ${id:firstName}
    Enter Last name         ${id:lastName}
    Enter user email        ${id:userEmail}
    Enter user age          ${id:age}
    Enter user salary       ${id:salary}
    Enter user department   ${id:department}
    Click Submit
    Verify presence of      ${id:firstName}

Check whether user not be able to add invalid data to table
    Click on ADD
    Enter First name        ${id:firstName}
    Enter Last name         ${id:lastName}
    Enter user email        ${id:userEmail}
    Enter user age          ${invalid_age}
    Enter user salary       ${id:salary}
    Enter user department   ${id:department}
    Click Submit
    Check presence of       ${form_registration}
    Click                   ${btn_close}
    Verify absence of       ${id:firstName}

Check whether user able to delete user from table
    Click on ADD
    Enter First name        ${id:firstName}
    Enter Last name         ${id:lastName}
    Enter user email        ${id:userEmail}
    Enter user age          ${id:age}
    Enter user salary       ${id:salary}
    Enter user department   ${id:department}
    Click Submit
    Verify presence of      ${id:firstName}
    Delete user             ${id:firstName}
    Verify absence of       ${id:firstName}

Check whether user able to edit user data in table
    Click on ADD
    Enter First name        ${id:firstName}
    Enter Last name         ${id:lastName}
    Enter user email        ${id:userEmail}
    Enter user age          ${id:age}
    Enter user salary       ${id:salary}
    Enter user department   ${id:department}
    Click Submit
    Verify presence of      ${id:firstName}
    Edit user               ${id:firstName}
    Clean Field Of Characters  ${txt_firstname}
    Enter First name        ${id:firstName_edited}
    Click Submit
    Verify presence of      ${id:firstName_edited}
    Verify absence of       ${id:firstName}

Check whether user is not able to add user with existing info
    Click on ADD
    Enter First name        ${id:firstName}
    Enter Last name         ${id:lastName}
    Enter user email        ${id:userEmail}
    Enter user age          ${id:age}
    Enter user salary       ${id:salary}
    Enter user department   ${id:department}
    Click Submit
    Click on ADD
    Enter First name        ${id:firstName}
    Enter Last name         ${id:lastName}
    Enter user email        ${id:userEmail}
    Enter user age          ${id:age}
    Enter user salary       ${id:salary}
    Enter user department   ${id:department}
    Click Submit
    Verify presence of      ${id:firstName}
    Verify absence of second    ${id:firstName}

Check whether user is able to turn the pages of the web table when the table has more than 10 rows
    Verify that Next and Previous buttons are disabled
    Add multiple records    11
    Verify that button is enabled   ${btn_next}
    Click button                    ${btn_next}
    Verify that button is enabled   ${btn_previous}
    Click button                    ${btn_previous}

Check whether user is able to turn the pages of the web table using input field
    Verify that Next and Previous buttons are disabled
    Add multiple records    20
    Move to last page
    Verify page number

Check whether user is not able to turn the pages of the web table when the table has more rows than items
    Verify that Next and Previous buttons are disabled
    Add multiple records    6
    Verify that Next and Previous buttons are disabled

Check whether user is able to select the number of rows per page
    Verify presence of the selector
    Select multiple value from selector and verify

Check whether user information is added to the end of the list
    Click on ADD
    Enter First name        ${id:firstName}
    Enter Last name         ${id:lastName}
    Enter user email        ${id:userEmail}
    Enter user age          ${id:age}
    Enter user salary       ${id:salary}
    Enter user department   ${id:department}
    Click Submit
    Count the items of the table    ${addres_of_items}
    Check that the item is added to the end of the list  ${id:firstName}