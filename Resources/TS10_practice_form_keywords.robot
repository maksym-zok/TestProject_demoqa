*** Settings ***
Library                 SeleniumLibrary
Variables               ../PageObjects/Locators.py

*** Keywords ***

Enter First name
    [Arguments]  ${username}
    input text  ${txt_practice_firstname}  ${username}

Enter Last name
    [Arguments]  ${lastname}
    input text  ${txt_practice_lastname}  ${lastname}

Enter user email
    [Arguments]  ${email}
    input text  ${txt_practice_userEmail}  ${email}


Enter user phone number
    [Arguments]  ${phone}
    input text  ${txt_phone_number}  ${phone}

Select month
    [Arguments]     ${month}
    select from list by label       ${date_picker_month}            ${month}

Select year
    [Arguments]     ${year}
    select from list by label       ${date_picker_year}             ${year}

Select day
    [Arguments]     ${day}  ${month}  ${year}
    click element                   xpath://div[@aria-label="Choose Wednesday, ${month} ${day}, ${year}"]

Select days
    [Arguments]     ${day}  ${month}  ${year}
    click element                   //div[contains(@aria-label, '${month} ${day}, ${year}')]

Verify date
    [Arguments]     ${day_month_year}
    ${value}                        get element attribute  ${date_picker}     value
    should be equal as strings      ${value}                                        ${day_month_year}

Enter subject
    [Arguments]  ${subject}
    input text                      ${txt_subject}                                ${subject}
    press keys                      ${txt_subject}                                ENTER

Enter state
    [Arguments]  ${state}
    input text                      ${txt_state}                                ${state}
    press keys                      ${txt_state}                                ENTER

Enter city
    [Arguments]  ${city}
    input text                      ${txt_city}                                ${city}
    press keys                      ${txt_city}                                ENTER

Enter user address
    [Arguments]     ${valid_address}
    input text                      ${txt_address}                   ${valid_address}

Select user state
    [Arguments]     ${valid_state}
    input text                      ${txt_state}                         ${valid_state}
    press keys                      ${txt_state}                         ENTER

Select user city
    [Arguments]     ${valid_city}
    input text                      ${txt_city}                         ${valid_city}
    press keys                      ${txt_city}                         ENTER

Click Submit
    click button    ${btn_submitnewrecord}

Verify user name
    [Arguments]     ${firstname}    ${lastname}
    element should contain          ${output_username}     ${firstName}   ${lastName}

Verify user email
    [Arguments]     ${email}
    element should contain          ${output_useremail}     ${email}

Verify user gender
    [Arguments]     ${gender}
    element should contain          ${output_usergender}     ${gender}

Verify user phone number
    [Arguments]     ${phone}
    element should contain          ${output_userphone}     ${phone}

Verify user date of birth
    [Arguments]     ${day}    ${month}  ${year}
    element should contain          ${output_userdate_of_brth}     ${day}   ${day}  ${year}

Verify user subject
    [Arguments]     ${subject}
    element should contain          ${output_user_subject}     ${subject}

Verify subject
    [Arguments]     ${inputed_subject}
    ${subject}                      get text                        ${output_subject}
    should be equal as strings      ${subject}                      ${inputed_subject}

Verify absence of
    [Arguments]     ${output}
    page should not contain element                     ${output}



Verify subjects
    [Arguments]     ${inputed_subject}
    ${res_plus_1}                   evaluate                        ${res}+1
    ${subject}                      get text                        (//div[contains(@class, 'subjects-auto-complete__multi-value__label')])[${res_plus_1}]
    should be equal as strings      ${subject}                      ${inputed_subject}

Verify state
    [Arguments]     ${inputed_state}
    ${subject}                      get text                        ${output_state}
    should be equal as strings      ${subject}                      ${inputed_state}

Verify city
    [Arguments]     ${inputed_city}
    ${subject}                      get text                        ${output_city}
    should be equal as strings      ${subject}                      ${inputed_city}

Verify user hobby
    [Arguments]     ${hobby1}    ${hobby2}    ${hobby3}
    element should contain          ${output_userhobby}     ${hobby1}    ${hobby2}    ${hobby3}
Verify checkbox is selected
    [Arguments]     ${hobby}
    checkbox should be selected     ${hobby}

Verify checkbox is unselected
    [Arguments]     ${hobby}
    checkbox should not be selected    ${hobby}

Verify user photo
    [Arguments]     ${photo}
    element should contain          ${output_userphoto}     ${photo}

Verify user address
    [Arguments]     ${address}
    element should contain          ${output_useraddress}     ${address}

Verify user state and city
    [Arguments]     ${state}    ${city}
    element should contain          ${output_user_state_city}     ${state}    ${city}

Verify Suitability of the
    [Arguments]  ${btn_color}
    ${element_red}                          Get CSS Property Value      ${btn_color}    border-color
    should be equal as strings              ${element_red}              ${rgb_red}

Verify Suitability of
    [Arguments]  ${btn_color}
    ${element_red}                          Get CSS Property Value      ${btn_color}    color
    should be equal as strings              ${element_red}              ${rgba_red}

Verify the absence of the
    [Arguments]  ${locator}
    element should not be visible   ${locator}
