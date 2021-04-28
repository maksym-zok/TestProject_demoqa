*** Settings ***
Library                 BuiltIn
Library                 Collections
Library                 SeleniumLibrary
Library                 RequestsLibrary
Resource                ../Bindings/keywords.robot
Resource                ../Resources/variables.robot
Resource                ../Resources/TS10_practice_form_keywords.robot
Test Setup              Start browser and maximaze  https://demoqa.com/automation-practice-form
Test Teardown           close browser

*** Variables ***
${UploadFiletest}           xpath://input[@id="uploadPicture"]
${AddFile}                  D:/download.jpg
${filename}                 download.jpg
${rgba_red}                 rgba(220, 53, 69, 1)
${rgb_red}                  rgb(220, 53, 69)

*** Test Cases ***
Check whether user is able to submit form with valid data
    Enter First name                ${id:firstName}
    Enter Last name                 ${id:lastName}
    Enter user email                ${id:userEmail}
    Click element                   ${radio_male}
    Enter user phone number         ${valid_phone_number}
    click element                   ${date_picker}
    Select month                    July
    Select year                     1993
    Select day                      21st    July    1993
    Verify date                     21 Jul 1993
    Enter subject                   Physics
    Click element                   ${checkbox_sports}
    Click element                   ${checkbox_reading}
    Click element                   ${checkbox_music}
    Choose File                     ${btn_UploadFile}       ${img_to_upload}
    Enter user address              ${valid_cur_address}
    Select user state               NCR
    Select user city                Delhi
    Click Submit
    Verify user name                ${id:firstName}         ${id:lastName}
    Verify user email               ${id:userEmail}
    Verify user gender              Male
    Verify user phone number        ${valid_phone_number}
    Verify user date of birth       21     July       1993
    Verify user subject             Physics
    Verify user hobby               Sports     Reading    Music
    Verify user photo               ${filename}
    Verify user address             ${valid_cur_address}
    Verify user state and city      NCR       Delhi

Check whether user is not able to submit form with empty firstname field
    Enter First name                ${EMPTY}
    Enter Last name                 ${id:lastName}
    Enter user email                ${id:userEmail}
    Click element                   ${radio_male}
    Enter user phone number         ${valid_phone_number}
    click element                   ${date_picker}
    Select month                    July
    Select year                     1993
    Select day                      21st    July    1993
    Verify date                     21 Jul 1993
    Enter subject                   Physics
    Click element                   ${checkbox_sports}
    Click element                   ${checkbox_reading}
    Click element                   ${checkbox_music}
    Choose File                     ${btn_UploadFile}       ${img_to_upload}
    Enter user address              ${valid_cur_address}
    Select user state               NCR
    Select user city                Delhi
    Click Submit
    Verify the absence of the       ${summary_table}
    sleep                           1s
    Verify Suitability of the       ${txt_practice_firstname}

Check whether user is not able to submit form with a Space in firstname field
    Enter First name                ${SPACE}
    Enter Last name                 ${id:lastName}
    Enter user email                ${id:userEmail}
    Click element                   ${radio_male}
    Enter user phone number         ${valid_phone_number}
    click element                   ${date_picker}
    Select month                    July
    Select year                     1993
    Select day                      21st    July    1993
    Verify date                     21 Jul 1993
    Enter subject                   Physics
    Click element                   ${checkbox_sports}
    Click element                   ${checkbox_reading}
    Click element                   ${checkbox_music}
    Choose File                     ${btn_UploadFile}       ${img_to_upload}
    Enter user address              ${valid_cur_address}
    Select user state               NCR
    Select user city                Delhi
    Click Submit
    Verify the absence of the       ${summary_table}
    sleep                           1s
    Verify Suitability of the       ${txt_practice_firstname}

Check whether user is not able to submit form with a 1-character firstname
    Enter First name                ${validusername1char}
    Enter Last name                 ${id:lastName}
    Enter user email                ${id:userEmail}
    Click element                   ${radio_male}
    Enter user phone number         ${valid_phone_number}
    click element                   ${date_picker}
    Select month                    July
    Select year                     1993
    Select day                      21st    July    1993
    Verify date                     21 Jul 1993
    Enter subject                   Physics
    Click element                   ${checkbox_sports}
    Click element                   ${checkbox_reading}
    Click element                   ${checkbox_music}
    Choose File                     ${btn_UploadFile}       ${img_to_upload}
    Enter user address              ${valid_cur_address}
    Select user state               NCR
    Select user city                Delhi
    Click Submit
    Verify the absence of the       ${summary_table}
    sleep                           1s
    Verify Suitability of the       ${txt_practice_firstname}

Check whether user is able to submit form with a 255-characters firstname
    Enter First name                ${validusername255char}
    Enter Last name                 ${id:lastName}
    Enter user email                ${id:userEmail}
    Click element                   ${radio_male}
    Enter user phone number         ${valid_phone_number}
    click element                   ${date_picker}
    Select month                    July
    Select year                     1993
    Select day                      21st    July    1993
    Verify date                     21 Jul 1993
    Enter subject                   Physics
    Click element                   ${checkbox_sports}
    Click element                   ${checkbox_reading}
    Click element                   ${checkbox_music}
    Choose File                     ${btn_UploadFile}       ${img_to_upload}
    Enter user address              ${valid_cur_address}
    Select user state               NCR
    Select user city                Delhi
    Click Submit
    Verify user name                ${validusername255char}         ${id:lastName}
    Verify user email               ${id:userEmail}
    Verify user gender              Male
    Verify user phone number        ${valid_phone_number}
    Verify user date of birth       21     July       1993
    Verify user subject             Physics
    Verify user hobby               Sports     Reading    Music
    Verify user photo               ${filename}
    Verify user address             ${valid_cur_address}
    Verify user state and city      NCR       Delhi

Check whether user is not able to submit form with a 256-characters firstname
    Enter First name                ${invalidusername256char}
    Enter Last name                 ${id:lastName}
    Enter user email                ${id:userEmail}
    Click element                   ${radio_male}
    Enter user phone number         ${valid_phone_number}
    click element                   ${date_picker}
    Select month                    July
    Select year                     1993
    Select day                      21st    July    1993
    Verify date                     21 Jul 1993
    Enter subject                   Physics
    Click element                   ${checkbox_sports}
    Click element                   ${checkbox_reading}
    Click element                   ${checkbox_music}
    Choose File                     ${btn_UploadFile}       ${img_to_upload}
    Enter user address              ${valid_cur_address}
    Select user state               NCR
    Select user city                Delhi
    Click Submit
    Verify the absence of the       ${summary_table}
    sleep                           1s
    Verify Suitability of the       ${txt_practice_firstname}

Check whether user is not able to submit form with empty lastname field
    Enter First name                ${id:firstName}
    Enter Last name                 ${EMPTY}
    Enter user email                ${id:userEmail}
    Click element                   ${radio_male}
    Enter user phone number         ${valid_phone_number}
    click element                   ${date_picker}
    Select month                    July
    Select year                     1993
    Select day                      21st    July    1993
    Verify date                     21 Jul 1993
    Enter subject                   Physics
    Click element                   ${checkbox_sports}
    Click element                   ${checkbox_reading}
    Click element                   ${checkbox_music}
    Choose File                     ${btn_UploadFile}       ${img_to_upload}
    Enter user address              ${valid_cur_address}
    Select user state               NCR
    Select user city                Delhi
    Click Submit
    Verify the absence of the       ${summary_table}
    sleep                           1s
    Verify Suitability of the       ${txt_practice_lastname}

Check whether user is not able to submit form with a Space in lastname field
    Enter First name                ${id:firstName}
    Enter Last name                 ${SPACE}
    Enter user email                ${id:userEmail}
    Click element                   ${radio_male}
    Enter user phone number         ${valid_phone_number}
    click element                   ${date_picker}
    Select month                    July
    Select year                     1993
    Select day                      21st    July    1993
    Verify date                     21 Jul 1993
    Enter subject                   Physics
    Click element                   ${checkbox_sports}
    Click element                   ${checkbox_reading}
    Click element                   ${checkbox_music}
    Choose File                     ${btn_UploadFile}       ${img_to_upload}
    Enter user address              ${valid_cur_address}
    Select user state               NCR
    Select user city                Delhi
    Click Submit
    Verify the absence of the       ${summary_table}
    sleep                           1s
    Verify Suitability of the       ${txt_practice_lastname}

Check whether user is not able to submit form with a 1-character lastname
    Enter First name                ${id:firstName}
    Enter Last name                 ${validusername1char}
    Enter user email                ${id:userEmail}
    Click element                   ${radio_male}
    Enter user phone number         ${valid_phone_number}
    click element                   ${date_picker}
    Select month                    July
    Select year                     1993
    Select day                      21st    July    1993
    Verify date                     21 Jul 1993
    Enter subject                   Physics
    Click element                   ${checkbox_sports}
    Click element                   ${checkbox_reading}
    Click element                   ${checkbox_music}
    Choose File                     ${btn_UploadFile}       ${img_to_upload}
    Enter user address              ${valid_cur_address}
    Select user state               NCR
    Select user city                Delhi
    Click Submit
    Verify the absence of the       ${summary_table}
    sleep                           1s
    Verify Suitability of the       ${txt_practice_lastname}

Check whether user is able to submit form with a 255-characters lastname
    Enter First name                ${id:firstName}
    Enter Last name                 ${validusername255char}
    Enter user email                ${id:userEmail}
    Click element                   ${radio_male}
    Enter user phone number         ${valid_phone_number}
    click element                   ${date_picker}
    Select month                    July
    Select year                     1993
    Select day                      21st    July    1993
    Verify date                     21 Jul 1993
    Enter subject                   Physics
    Click element                   ${checkbox_sports}
    Click element                   ${checkbox_reading}
    Click element                   ${checkbox_music}
    Choose File                     ${btn_UploadFile}       ${img_to_upload}
    Enter user address              ${valid_cur_address}
    Select user state               NCR
    Select user city                Delhi
    Click Submit
    Verify user name                ${id:firstName}         ${validusername255char}
    Verify user email               ${id:userEmail}
    Verify user gender              Male
    Verify user phone number        ${valid_phone_number}
    Verify user date of birth       21     July       1993
    Verify user subject             Physics
    Verify user hobby               Sports     Reading    Music
    Verify user photo               ${filename}
    Verify user address             ${valid_cur_address}
    Verify user state and city      NCR       Delhi

Check whether user is not able to submit form with a 256-characters lastname
    Enter First name                ${id:firstName}
    Enter Last name                 ${invalidusername256char}
    Enter user email                ${id:userEmail}
    Click element                   ${radio_male}
    Enter user phone number         ${valid_phone_number}
    click element                   ${date_picker}
    Select month                    July
    Select year                     1993
    Select day                      21st    July    1993
    Verify date                     21 Jul 1993
    Enter subject                   Physics
    Click element                   ${checkbox_sports}
    Click element                   ${checkbox_reading}
    Click element                   ${checkbox_music}
    Choose File                     ${btn_UploadFile}       ${img_to_upload}
    Enter user address              ${valid_cur_address}
    Select user state               NCR
    Select user city                Delhi
    Click Submit
    Verify the absence of the       ${summary_table}
    sleep                           1s
    Verify Suitability of the       ${txt_practice_lastname}

Check whether user is not able to submit form with invalid email
    Enter First name                ${id:firstName}
    Enter Last name                 ${id:lastName}
    Enter user email                ${invalid_email}
    Click element                   ${radio_male}
    Enter user phone number         ${valid_phone_number}
    click element                   ${date_picker}
    Select month                    July
    Select year                     1993
    Select day                      21st    July    1993
    Verify date                     21 Jul 1993
    Enter subject                   Physics
    Click element                   ${checkbox_sports}
    Click element                   ${checkbox_reading}
    Click element                   ${checkbox_music}
    Choose File                     ${btn_UploadFile}       ${img_to_upload}
    Enter user address              ${valid_cur_address}
    Select user state               NCR
    Select user city                Delhi
    Click Submit
    Verify the absence of the       ${summary_table}
    sleep                           1s
    Verify Suitability of the       ${txt_practice_userEmail}

Check whether user is able to submit form with empty email field
    Enter First name                ${id:firstName}
    Enter Last name                 ${id:lastName}
    Enter user email                ${EMPTY}
    Click element                   ${radio_male}
    Enter user phone number         ${valid_phone_number}
    click element                   ${date_picker}
    Select month                    July
    Select year                     1993
    Select day                      21st    July    1993
    Verify date                     21 Jul 1993
    Enter subject                   Physics
    Click element                   ${checkbox_sports}
    Click element                   ${checkbox_reading}
    Click element                   ${checkbox_music}
    Choose File                     ${btn_UploadFile}       ${img_to_upload}
    Enter user address              ${valid_cur_address}
    Select user state               NCR
    Select user city                Delhi
    Click Submit
    Verify user name                ${id:firstName}         ${id:lastName}
    Verify user email               ${EMPTY}
    Verify user gender              Male
    Verify user phone number        ${valid_phone_number}
    Verify user date of birth       21     July       1993
    Verify user subject             Physics
    Verify user hobby               Sports     Reading    Music
    Verify user photo               ${filename}
    Verify user address             ${valid_cur_address}
    Verify user state and city      NCR       Delhi

Check whether user is able to submit form with a Space in email field
    Enter First name                ${id:firstName}
    Enter Last name                 ${id:lastName}
    Enter user email                ${SPACE}
    Click element                   ${radio_male}
    Enter user phone number         ${valid_phone_number}
    click element                   ${date_picker}
    Select month                    July
    Select year                     1993
    Select day                      21st    July    1993
    Verify date                     21 Jul 1993
    Enter subject                   Physics
    Click element                   ${checkbox_sports}
    Click element                   ${checkbox_reading}
    Click element                   ${checkbox_music}
    Choose File                     ${btn_UploadFile}       ${img_to_upload}
    Enter user address              ${valid_cur_address}
    Select user state               NCR
    Select user city                Delhi
    Click Submit
    Verify user name                ${id:firstName}         ${id:lastName}
    Verify user email               ${EMPTY}
    Verify user gender              Male
    Verify user phone number        ${valid_phone_number}
    Verify user date of birth       21     July       1993
    Verify user subject             Physics
    Verify user hobby               Sports     Reading    Music
    Verify user photo               ${filename}
    Verify user address             ${valid_cur_address}
    Verify user state and city      NCR       Delhi

Check whether user is not able to submit form with unpicked gender options
    Enter First name                ${id:firstName}
    Enter Last name                 ${id:lastName}
    Enter user email                ${id:userEmail}
    Enter user phone number         ${valid_phone_number}
    click element                   ${date_picker}
    Select month                    July
    Select year                     1993
    Select day                      21st    July    1993
    Verify date                     21 Jul 1993
    Enter subject                   Physics
    Click element                   ${checkbox_sports}
    Click element                   ${checkbox_reading}
    Click element                   ${checkbox_music}
    Choose File                     ${btn_UploadFile}       ${img_to_upload}
    Enter user address              ${valid_cur_address}
    Select user state               NCR
    Select user city                Delhi
    Click Submit
    Verify the absence of the       ${summary_table}
    sleep                           1s
    Verify Suitability of           ${radio_male}
    Verify Suitability of           ${radio_female}
    Verify Suitability of           ${radio_other}

Check whether user is not able to submit form with empty phone number field
    Enter First name                ${id:firstName}
    Enter Last name                 ${id:lastName}
    Enter user email                ${id:userEmail}
    Click element                   ${radio_male}
    Enter user phone number         ${EMPTY}
    click element                   ${date_picker}
    Select month                    July
    Select year                     1993
    Select day                      21st    July    1993
    Verify date                     21 Jul 1993
    Enter subject                   Physics
    Click element                   ${checkbox_sports}
    Click element                   ${checkbox_reading}
    Click element                   ${checkbox_music}
    Choose File                     ${btn_UploadFile}       ${img_to_upload}
    Enter user address              ${valid_cur_address}
    Select user state               NCR
    Select user city                Delhi
    Click Submit
    Verify the absence of the       ${summary_table}
    sleep                           1s
    Verify Suitability of the       ${txt_phone_number}

Check whether user is not able to submit form with invalid phone number
    Enter First name                ${id:firstName}
    Enter Last name                 ${id:lastName}
    Enter user email                ${id:userEmail}
    Click element                   ${radio_male}
    Enter user phone number         ${invalid_phone_number}
    click element                   ${date_picker}
    Select month                    July
    Select year                     1993
    Select day                      21st    July    1993
    Verify date                     21 Jul 1993
    Enter subject                   Physics
    Click element                   ${checkbox_sports}
    Click element                   ${checkbox_reading}
    Click element                   ${checkbox_music}
    Choose File                     ${btn_UploadFile}       ${img_to_upload}
    Enter user address              ${valid_cur_address}
    Select user state               NCR
    Select user city                Delhi
    Click Submit
    Verify the absence of the       ${summary_table}
    sleep                           1s
    Verify Suitability of the       ${txt_phone_number}

Check whether user is not able to submit form with 1-digit phone number
    Enter First name                ${id:firstName}
    Enter Last name                 ${id:lastName}
    Enter user email                ${id:userEmail}
    Click element                   ${radio_male}
    Enter user phone number         ${invalid_phone_number_1_digit}
    click element                   ${date_picker}
    Select month                    July
    Select year                     1993
    Select day                      21st    July    1993
    Verify date                     21 Jul 1993
    Enter subject                   Physics
    Click element                   ${checkbox_sports}
    Click element                   ${checkbox_reading}
    Click element                   ${checkbox_music}
    Choose File                     ${btn_UploadFile}       ${img_to_upload}
    Enter user address              ${valid_cur_address}
    Select user state               NCR
    Select user city                Delhi
    Click Submit
    Verify the absence of the       ${summary_table}
    sleep                           1s
    Verify Suitability of the       ${txt_phone_number}

Check whether user is not able to submit form with 9-digit phone number
    Enter First name                ${id:firstName}
    Enter Last name                 ${id:lastName}
    Enter user email                ${id:userEmail}
    Click element                   ${radio_male}
    Enter user phone number         ${invalid_phone_number_9_digit}
    click element                   ${date_picker}
    Select month                    July
    Select year                     1993
    Select day                      21st    July    1993
    Verify date                     21 Jul 1993
    Enter subject                   Physics
    Click element                   ${checkbox_sports}
    Click element                   ${checkbox_reading}
    Click element                   ${checkbox_music}
    Choose File                     ${btn_UploadFile}       ${img_to_upload}
    Enter user address              ${valid_cur_address}
    Select user state               NCR
    Select user city                Delhi
    Click Submit
    Verify the absence of the       ${summary_table}
    sleep                           1s
    Verify Suitability of the       ${txt_phone_number}

Check whether user is able to add multiple subjects to subject field
    FOR    ${res}    IN RANGE    0    4
            set global variable             ${res}
            Enter subject        ${LIST_SUBJECTS}[${res}]
            Verify subjects      ${LIST_SUBJECTS}[${res}]
    END

Check whether subject field is able to autocomplete names of the subjects
    FOR    ${res}    IN RANGE    0    4
            set global variable             ${res}
            Enter subject        ${LIS_SUBJECTS}[${res}]
            Verify subjects      ${LIST_SUBJECTS}[${res}]
    END

Check whether user is able to delete a subject from subject field
    FOR    ${res}    IN RANGE    0    4
            set global variable             ${res}
            Enter subject       ${LIS_SUBJECTS}[${res}]
            Verify subject      ${LIST_SUBJECTS}[${res}]
            Click element       ${btn_delete_subject}
    END

Check whether user is unable to add invalid subject to subject field
    Enter subject       No_name_subject
    Verify absence of   ${output_subject}

Check whether user is able to pick hobbie
    click element                   ${checkbox_sports}
    Verify checkbox is selected     ${output_hobby_sports}

Check whether user is able to unpick hobbie
    click element                   ${checkbox_sports}
    Verify checkbox is selected     ${output_hobby_sports}
    click element                   ${checkbox_sports}
    Verify checkbox is unselected   ${output_hobby_sports}

Check whether user is able to submit form with empty address field
    Enter First name                ${id:firstName}
    Enter Last name                 ${id:lastName}
    Enter user email                ${id:userEmail}
    Click element                   ${radio_male}
    Enter user phone number         ${valid_phone_number}
    click element                   ${date_picker}
    Select month                    July
    Select year                     1993
    Select day                      21st    July    1993
    Verify date                     21 Jul 1993
    Enter subject                   Physics
    Click element                   ${checkbox_sports}
    Click element                   ${checkbox_reading}
    Click element                   ${checkbox_music}
    Choose File                     ${btn_UploadFile}       ${img_to_upload}
    Enter user address              ${EMPTY}
    Select user state               NCR
    Select user city                Delhi
    Click Submit
    Verify user name                ${id:firstName}         ${id:lastName}
    Verify user email               ${id:userEmail}
    Verify user gender              Male
    Verify user phone number        ${valid_phone_number}
    Verify user date of birth       21     July       1993
    Verify user subject             Physics
    Verify user hobby               Sports     Reading    Music
    Verify user photo               ${filename}
    Verify user address             ${EMPTY}
    Verify user state and city      NCR       Delhi

Check whether user is able to submit form with 1-character address
    Enter First name                ${id:firstName}
    Enter Last name                 ${id:lastName}
    Enter user email                ${id:userEmail}
    Click element                   ${radio_male}
    Enter user phone number         ${valid_phone_number}
    click element                   ${date_picker}
    Select month                    July
    Select year                     1993
    Select day                      21st    July    1993
    Verify date                     21 Jul 1993
    Enter subject                   Physics
    Click element                   ${checkbox_sports}
    Click element                   ${checkbox_reading}
    Click element                   ${checkbox_music}
    Choose File                     ${btn_UploadFile}       ${img_to_upload}
    Enter user address              ${validusername1char}
    Select user state               NCR
    Select user city                Delhi
    Click Submit
    Verify user name                ${id:firstName}         ${id:lastName}
    Verify user email               ${id:userEmail}
    Verify user gender              Male
    Verify user phone number        ${valid_phone_number}
    Verify user date of birth       21     July       1993
    Verify user subject             Physics
    Verify user hobby               Sports     Reading    Music
    Verify user photo               ${filename}
    Verify user address             ${validusername1char}
    Verify user state and city      NCR       Delhi

Check whether user is able to submit form with a 255-characters address
    Enter First name                ${id:firstName}
    Enter Last name                 ${id:lastName}
    Enter user email                ${id:userEmail}
    Click element                   ${radio_male}
    Enter user phone number         ${valid_phone_number}
    click element                   ${date_picker}
    Select month                    July
    Select year                     1993
    Select day                      21st    July    1993
    Verify date                     21 Jul 1993
    Enter subject                   Physics
    Click element                   ${checkbox_sports}
    Click element                   ${checkbox_reading}
    Click element                   ${checkbox_music}
    Choose File                     ${btn_UploadFile}       ${img_to_upload}
    Enter user address              ${validusername255char}
    Select user state               NCR
    Select user city                Delhi
    Click Submit
    Verify user name                ${id:firstName}         ${id:lastName}
    Verify user email               ${id:userEmail}
    Verify user gender              Male
    Verify user phone number        ${valid_phone_number}
    Verify user date of birth       21     July       1993
    Verify user subject             Physics
    Verify user hobby               Sports     Reading    Music
    Verify user photo               ${filename}
    Verify user address             ${validusername255char}
    Verify user state and city      NCR       Delhi

Check whether user is not able to submit form with a 256-characters address
    Enter First name                ${id:firstName}
    Enter Last name                 ${id:lastName}
    Enter user email                ${id:userEmail}
    Click element                   ${radio_male}
    Enter user phone number         ${valid_phone_number}
    click element                   ${date_picker}
    Select month                    July
    Select year                     1993
    Select day                      21st    July    1993
    Verify date                     21 Jul 1993
    Enter subject                   Physics
    Click element                   ${checkbox_sports}
    Click element                   ${checkbox_reading}
    Click element                   ${checkbox_music}
    Choose File                     ${btn_UploadFile}       ${img_to_upload}
    Enter user address              ${invalidusername256char}
    Select user state               NCR
    Select user city                Delhi
    Click Submit
    Verify the absence of the       ${summary_table}
    sleep                           1s
    Verify Suitability of the       ${txt_address}

Check whether user is able to add state to state field
    FOR    ${res}    IN RANGE    0    4
            Enter state         ${STATE}[${res}]
            Verify state        ${STATE}[${res}]
    END

Check whether state field is able to autocomplete names of the states
    FOR    ${res}    IN RANGE    0    4
            Enter state         ${STAT}[${res}]
            Verify state        ${STATE}[${res}]
    END

Check whether user is unable to add invalid state name to state field
    Enter state                 No_name_state
    Verify absence of           ${output_state}

Check whether user is able to add city to the city field
    Enter state                 NCR
    FOR    ${res}    IN RANGE    0    2
            Enter city          ${STATE_NCR}[${res}]
            Verify city         ${STATE_NCR}[${res}]
    END

Check whether city field is able to autocomplete names of the cities
    Enter state                 NCR
    FOR    ${res}    IN RANGE    0    2
            Enter city          ${STATE_NC}[${res}]
            Verify city         ${STATE_NCR}[${res}]
    END

Check whether user is unable to add invalid city name to city field
    Enter state                 NCR
    Enter city                  No_name_city
    Verify absence of           ${output_city}