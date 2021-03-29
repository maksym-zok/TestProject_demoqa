*** Settings ***

Library     Collections
Library     RequestsLibrary
Resource    ../Bindings/keywords.robot


*** Variables ***
${base_url}     https://demoqa.com
${userName}     testussser2s
${password}     1234qweRE!
*** Test Cases ***
User_registration_with_valid_data

    create session      user_registration       ${base_url}

    ${response}         Input username and password  ${userName}  ${password}

    log to console      ${response.status_code}
    log to console      ${response.content}
    log to console      ${response.headers}


    #Validation
    ${status_code}     convert to string        ${response.status_code}
    should be equal     ${status_code}          201

    ${res_body}         convert to string       ${response.content}
    should contain      ${res_body}             ${userName}

User_registration_with_empty_username_field

    Create Session      user_registration       ${base_url}

    ${response}         Input username and password  ${EMPTY}  ${password}

    log to console     ${response.status_code}
    log to console     ${response.content}
    log to console     ${response.headers}

    #validation
    ${status_code}     convert to string        ${response.status_code}
    should be equal     ${status_code}          400

    ${res_content}      convert to string       ${response.content}
    should contain      ${res_content}          UserName and Password required.

User_registration_with_empty_password_field

    create session      user_registration       ${base_url}

    ${response}         Input username and password  ${userName}  ${EMPTY}

    log to console      ${response.status_code}
    log to console      ${response.content}
    log to console      ${response.headers}

    #Validation
    ${status_code}      convert to string       ${response.status_code}
    should be equal     ${status_code}          400

    ${res_content}      convert to string       ${response.content}
    should contain      ${res_content}          UserName and Password required.

User_registration_with_existing_user

    create session      user_registration       ${base_url}

    ${response}         Input username and password  ${userName}  ${password}

    log to console      ${response.status_code}
    log to console      ${response.content}
    log to console      ${response.headers}

    #Validation
    ${status_code}      convert to string       ${response.status_code}
    should be equal     ${status_code}          406
    ${res_content}      convert to string       ${response.content}
    should contain      ${res_content}          User exists!

User_registration_with_invalid_password

    create session      user_registration       ${base_url}

    ${response}         Input username and password  ${userName}  215648sa

    log to console      ${response.status_code}
    log to console      ${response.content}
    log to console      ${response.headers}

    #Validation
    ${status_code}      convert to string       ${response.status_code}
    should be equal     ${status_code}          400
    ${res_content}      convert to string       ${response.content}
    should contain      ${res_content}          Passwords must have at least one non alphanumeric character, one digit ('0'-'9'), one uppercase ('A'-'Z'), one lowercase ('a'-'z'), one special character and Password must be eight characters or longer.