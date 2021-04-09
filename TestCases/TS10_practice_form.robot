*** Settings ***
Library                 BuiltIn
Library                 Collections
Library                 SeleniumLibrary
Library                 RequestsLibrary
Resource                ../Bindings/keywords.robot
Resource                ../Resources/variables.robot
Test Setup              Start browser and maximaze  https://demoqa.com/automation-practice-form
Test Teardown           close browser

*** Variables ***
${UploadFiletest}           xpath://input[@id="uploadPicture"]
${AddFile}                  D:/download.jpg
${filename}                 download.jpg
${rgba_red}                 rgba(220, 53, 69, 1)
${rgb_red}                  rgb(2s20, 53, 69)

*** Test Cases ***
Check practice form works with valid data
    input text                      id:firstName                                    ${id:firstName}
    input text                      id:lastName                                     ${id:lastName}
    input text                      id:userEmail                                    ${id:userEmail}
    click element                   //label[text()='Male']
    input text                      id:userNumber                                   ${valid_phone_number}
    click element                   id:dateOfBirthInput
    select month                    July
    select year                     1993
    select day                      21st    July    1993
    ${value}                        get element attribute   id:dateOfBirthInput     value
    should be equal as strings      ${value}                                        21 Jul 1993
    press keys                      id:dateOfBirthInput                             ENTER
    input text                      id:subjectsInput                                Physics
    press keys                      id:subjectsInput                                ENTER
    click element                   xpath://label[@for="hobbies-checkbox-1"]
    click element                   xpath://label[@for="hobbies-checkbox-2"]
    click element                   xpath://label[@for="hobbies-checkbox-3"]
    Wait Until Page Contains Element   ${UploadFiletest}                            60s
    Choose File                     ${UploadFiletest}                               ${AddFile}
    input text                      id:currentAddress                               ${valid_cur_address}
    input text                      id:react-select-3-input                         NCR
    press keys                      id:react-select-3-input                         ENTER
    input text                      id:react-select-4-input                         Delhi
    press keys                      id:react-select-4-input                         ENTER
    click element                   id:submit
    element should contain          xpath:((//tbody/tr)[1]/td)[2]                   ${id:firstName}   ${id:lastName}
    element should contain          xpath:((//tbody/tr)[2]/td)[2]                   ${id:userEmail}
    element should contain          xpath:((//tbody/tr)[3]/td)[2]                   Male
    element should contain          xpath:((//tbody/tr)[4]/td)[2]                   ${valid_phone_number}
    element should contain          xpath:((//tbody/tr)[5]/td)[2]                   21     July       1993
    element should contain          xpath:((//tbody/tr)[6]/td)[2]                   Physics
    element should contain          xpath:((//tbody/tr)[7]/td)[2]                   Sports     Reading    Music
    element should contain          xpath:((//tbody/tr)[8]/td)[2]                   ${filename}
    element should contain          xpath:((//tbody/tr)[9]/td)[2]                   ${valid_cur_address}
    element should contain          xpath:((//tbody/tr)[10]/td)[2]                  NCR       Delhi

Check whether user is not able to submit form with empty firstname field
    input text                      id:firstName                                    ${EMPTY}
    input text                      id:lastName                                     ${id:lastName}
    input text                      id:userEmail                                    ${id:userEmail}
    click element                   //label[text()='Male']
    input text                      id:userNumber                                   ${valid_phone_number}
    click element                   id:submit
    element should not be visible   //div[@class='modal-content']
    wait until page contains element    //form[@class='was-validated']
    sleep                           1s
    ${first_name_color}             Get CSS Property Value          id:firstName    border-color
    should be equal as strings      ${first_name_color}             ${rgb_red}

Check whether user is not able to submit form with a Space in firstname field
    input text                      id:firstName                                    ${SPACE}
    input text                      id:lastName                                     ${id:lastName}
    input text                      id:userEmail                                    ${id:userEmail}
    click element                   //label[text()='Male']
    input text                      id:userNumber                                   ${valid_phone_number}
    click element                   id:submit
    element should not be visible   //div[@class='modal-content']
    wait until page contains element    //form[@class='was-validated']
    sleep                           1s
    ${first_name_color}             Get CSS Property Value          id:firstName    border-color
    should be equal as strings      ${first_name_color}             ${rgb_red}

Check whether user is not able to submit form with empty second name field
    input text                      id:firstName                                    ${valid_username}
    input text                      id:lastName                                     ${EMPTY}
    input text                      id:userEmail                                    ${id:userEmail}
    click element                   //label[text()='Male']
    input text                      id:userNumber                                   ${valid_phone_number}
    click element                   id:submit
    element should not be visible   //div[@class='modal-content']
    wait until page contains element    //form[@class='was-validated']
    sleep                           1s
    ${last_name_color}              Get CSS Property Value          id:lastName     border-color
    should be equal as strings      ${last_name_color}             ${rgb_red}

Check whether user is not able to submit form with a Space in second name field
    input text                      id:firstName                                    ${id:firstName}
    input text                      id:lastName                                     ${SPACE}
    input text                      id:userEmail                                    ${id:userEmail}
    click element                   //label[text()='Male']
    input text                      id:userNumber                                   ${valid_phone_number}
    click element                   id:submit
    element should not be visible   //div[@class='modal-content']
    wait until page contains element    //form[@class='was-validated']
    sleep                           1s
    ${last_name_color}              Get CSS Property Value          id:lastName     border-color
    should be equal as strings      ${last_name_color}             ${rgb_red}

Check whether user is not able to submit form with unpicked gender options
    input text                      id:firstName                                    ${id:firstName}
    input text                      id:lastName                                     ${id:lastName}
    input text                      id:userEmail                                    ${id:userEmail}
    input text                      id:userNumber                                   ${valid_phone_number}
    click element                   id:submit
    element should not be visible   //div[@class='modal-content']
    wait until page contains element    //form[@class='was-validated']
    sleep                           1s
    ${male_color}                   Get CSS Property Value          //label[text()='Male']  color
    should be equal as strings      ${male_color}                   ${rgba_red}
    ${female_color}                 Get CSS Property Value          //label[text()='Female']  color
    should be equal as strings      ${female_color}                 ${rgba_red}
    ${other_color}                  Get CSS Property Value          //label[text()='Other']  color
    should be equal as strings      ${other_color}                  ${rgba_red}

Check whether user is not able to submit form with empty phone number field
    input text                      id:firstName                                    ${id:firstName}
    input text                      id:lastName                                     ${id:lastName}
    input text                      id:userEmail                                    ${id:userEmail}
    click element                   //label[text()='Male']
    input text                      id:userNumber                                   ${EMPTY}
    click element                   id:submit
    element should not be visible   //div[@class='modal-content']
    wait until page contains element    //form[@class='was-validated']
    sleep                           1s
    ${phone_number}                 Get CSS Property Value          id:userNumber   border-color
    should be equal as strings      ${phone_number}                 ${rgb_red}
Check whether user is not able to submit form with invalid phone number
    input text                      id:firstName                                    ${id:firstName}
    input text                      id:lastName                                     ${id:lastName}
    input text                      id:userEmail                                    ${id:userEmail}
    click element                   //label[text()='Male']
    input text                      id:userNumber                                   ${invalid_phone_number}
    click element                   id:submit
    element should not be visible   //div[@class='modal-content']
    wait until page contains element    //form[@class='was-validated']
    sleep                           1s
    ${phone_number}                 Get CSS Property Value          id:userNumber   border-color
    should be equal as strings      ${phone_number}                 ${rgb_red}

Check whether user is not able to submit form with empty phone number field
    input text                      id:firstName                                    ${id:firstName}
    input text                      id:lastName                                     ${id:lastName}
    input text                      id:userEmail                                    ${id:userEmail}
    click element                   //label[text()='Male']
    input text                      id:userNumber                                   ${EMPTY}
    click element                   id:submit
    element should not be visible   //div[@class='modal-content']
    wait until page contains element    //form[@class='was-validated']
    sleep                           1s
    ${phone_number}                 Get CSS Property Value          id:userNumber   border-color
    should be equal as strings      ${phone_number}                 ${rgb_red}

Check whether user is not able to submit form with invalid email
    input text                      id:firstName                                    ${id:firstName}
    input text                      id:lastName                                     ${id:lastName}
    input text                      id:userEmail                                    ${invalid_email}
    click element                   //label[text()='Male']
    input text                      id:userNumber                                   ${valid_phone_number}
    click element                   id:submit
    element should not be visible   //div[@class='modal-content']
    wait until page contains element    //form[@class='was-validated']
    sleep                           1s
    ${email_color}                  Get CSS Property Value          id:userEmail    border-color
    should be equal as strings      ${email_color}                  ${rgb_red}

Check whether the date of birth picker displays the date that user selects
    click element                   id:dateOfBirthInput
    Calendar navigate               previous
    Calendar navigate               next
    select month                    July
    select year                     1993
    select day                      21st    July    1993
    ${value}                        get element attribute   id:dateOfBirthInput     value
    should be equal as strings      ${value}                                        21 Jul 1993





