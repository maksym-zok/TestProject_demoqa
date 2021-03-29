*** Settings ***

Library     Collections
Library     RequestsLibrary

*** Keywords ***
Input username and password
    [Arguments]  ${name}    ${passwrd}
    ${header}          Create dictionary        Content-Type=application/json
    ${response}        post request             user_registration    /Account/v1/User   data={"userName": "${name}", "password": "${passwrd}"}    headers=${header}
    [Return]  ${response}
