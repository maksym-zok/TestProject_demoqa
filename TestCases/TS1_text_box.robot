*** Settings ***
Library                 BuiltIn
Library                 Collections
Library                 RequestsLibrary
Library                 SeleniumLibrary
Resource                ../Bindings/keywords.robot
Resource                ../Resources/variables.robot
Resource                ../Resources/TS1_text_box_keywords.robot
Test Setup              Start browser and maximaze  https://demoqa.com/text-box
Test Teardown           close browser

*** Test Cases ***
Check that the data in the text fields match the output data
    Enter UserName              ${valid_username}
    Enter Email                 ${valid_email}
    Enter Current Address       ${valid_cur_address}
    Enter Permanent Address     ${valid_per_address}
    Click Submit
    Inputted data corresponds to the data in the response

Check whether email field doesnt accept invalid data on the textbox page
    Enter UserName              ${valid_username}
    Enter Email                 ${invalid_email}
    Enter Current Address       ${valid_cur_address}
    Enter Permanent Address     ${valid_per_address}
    Click Submit
    Verify absence of           ${output_box}

Check whether email field doesnt accept empty field on the textbox page
    Enter UserName              ${valid_username}
    Enter Email                 ${EMPTY}
    Enter Current Address       ${valid_cur_address}
    Enter Permanent Address     ${valid_per_address}
    Click Submit
    Verify absence of           ${output_textboxEmail}

Check whether username field doesnt accept empty field on the textbox page
    Enter UserName              ${EMPTY}
    Enter Email                 ${valid_email}
    Enter Current Address       ${valid_cur_address}
    Enter Permanent Address     ${valid_per_address}
    Click Submit
    Verify absence of           ${output_textboxUserName}

Check whether username field accepts 1-character username on the textbox page
    Enter UserName              ${validusername1char}
    Enter Email                 ${valid_email}
    Enter Current Address       ${valid_cur_address}
    Enter Permanent Address     ${valid_per_address}
    Click Submit
    Varify presence of          ${output_textboxUserName}

Check whether username field accepts 255-character username on the textbox page
    Enter UserName              ${validusername255char}
    Enter Email                 ${valid_email}
    Enter Current Address       ${valid_cur_address}
    Enter Permanent Address     ${valid_per_address}
    Click Submit
    Varify presence of          ${output_textboxUserName}

Check whether username field doesnt accept 256-character username on the textbox page
    Enter UserName              ${invalidusername256char}
    Enter Email                 ${valid_email}
    Enter Current Address       ${valid_cur_address}
    Enter Permanent Address     ${valid_per_address}
    Click Submit
    Verify absence of           ${output_textboxUserName}

Check whether current address field doesnt accept empty field on the textbox page
    Enter UserName              ${valid_username}
    Enter Email                 ${valid_email}
    Enter Current Address       ${EMPTY}
    Enter Permanent Address     ${valid_per_address}
    Click Submit
    Verify absence of           ${output_textboxCurrentAddress}

Check whether current address field accepts 1-character current address on the textbox page
    Enter UserName              ${valid_username}
    Enter Email                 ${valid_email}
    Enter Current Address       ${valid_1char_address}
    Enter Permanent Address     ${valid_per_address}
    Click Submit
    Varify presence of          ${output_textboxCurrentAddress}

Check whether current address field accepts 255-character current address on the textbox page
    Enter UserName              ${valid_username}
    Enter Email                 ${valid_email}
    Enter Current Address       ${valid_255char_address}
    Enter Permanent Address     ${valid_per_address}
    Click Submit
    Varify presence of           ${output_textboxCurrentAddress}

Check whether current address field doesnt accept 256-character current address on the textbox page
    Enter UserName              ${valid_username}
    Enter Email                 ${valid_email}
    Enter Current Address       ${invalid_256char_address}
    Enter Permanent Address     ${valid_per_address}
    Click Submit
    Verify absence of           ${output_textboxCurrentAddress}

Check whether permanent address field doesnt accept empty field on the textbox page
    Enter UserName              ${valid_username}
    Enter Email                 ${valid_email}
    Enter Current Address       ${valid_cur_address}
    Enter Permanent Address     ${EMPTY}
    Click Submit
    Verify absence of           ${output_textboxPermanentAddress}

Check whether permanent address field accepts 1-character permanent address on the textbox page
    Enter UserName              ${valid_username}
    Enter Email                 ${valid_email}
    Enter Current Address       ${valid_cur_address}
    Enter Permanent Address     ${valid_1char_address}
    Click Submit
    Varify presence of          ${output_textboxPermanentAddress}

Check whether permanent address field accepts 255-character permanent address on the textbox page
    Enter UserName              ${valid_username}
    Enter Email                 ${valid_email}
    Enter Current Address       ${valid_cur_address}
    Enter Permanent Address     ${valid_255char_address}
    Click Submit
    Varify presence of          ${output_textboxPermanentAddress}

Check whether permanent address field doesnt accept 256-character permanent address on the textbox page
    Enter UserName              ${valid_username}
    Enter Email                 ${valid_email}
    Enter Current Address       ${valid_cur_address}
    Enter Permanent Address     ${invalid_256char_address}
    Click Submit
    Verify absence of           ${output_textboxPermanentAddress}