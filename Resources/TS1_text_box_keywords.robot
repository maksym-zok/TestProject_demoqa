*** Settings ***
Library                 SeleniumLibrary
Variables               ../PageObjects/Locators.py

*** Keywords ***
Enter UserName
    [Arguments]  ${username}
    input text  ${txt_textboxUserName}  ${username}

Enter Email
    [Arguments]  ${email}
    input text  ${txt_textboxUserEmail}  ${email}

Enter Current Address
    [Arguments]  ${currentAddress}
    input text  ${txt_textboxCurrentAddress}  ${currentAddress}

Enter Permanent Address
    [Arguments]  ${permanentAddress}
    input text  ${txt_textboxPermanentAddress}  ${permanentAddress}

Click Submit
    click button    ${btn_textboxSubmit}

Verify absence of
    [Arguments]  ${element}
    wait until page does not contain element    ${element}

Varify presence of
    [Arguments]  ${element}
    wait until page contains element    ${element}

Inputted data corresponds to the data in the response
    wait until element contains  ${output_textboxUserName}    ${valid_username}
    wait until element contains  ${output_textboxEmail}          ${valid_email}
    wait until element contains  ${output_textboxCurrentAddress}    ${valid_cur_address}
    wait until element contains  ${output_textboxPermanentAddress}    ${valid_per_address}