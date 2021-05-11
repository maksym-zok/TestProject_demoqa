*** Settings ***
Library                 BuiltIn
Library                 Collections
Library                 SeleniumLibrary
Resource                ../Bindings/keywords.robot
Resource                ../Resources/variables.robot
Resource                ../Resources/TS15_modal_dialogs_keywords.robot
Test Setup              Start browser and maximaze  https://demoqa.com/modal-dialogs
Test Teardown           close browser

*** Test Cases ***
Check whether small popup dialog is closed
    Verify that dialog is closed    ${small_modal_dialog}

Check whether large popup dialog is closed
    Verify that dialog is closed    ${large_modal_dialog}

Check whether small popup dialogs is visible after click
    Open popup dialog               ${btn_open_small_dialog}
    Verify that dialog is open      ${small_modal_dialog}

Check whether large popup dialogs is visible after click
    Open popup dialog               ${btn_open_large_dialog}
    Verify that dialog is open      ${large_modal_dialog}

Check whether small popup dialog is invisiable after clossing
    Open popup dialog               ${btn_open_small_dialog}
    Verify that dialog is open      ${small_modal_dialog}
    Close popup dialog              ${btn_close_small_dialog}
    Verify that dialog is closed    ${small_modal_dialog}

Check whether large popup dialog is invisiable after clossing
    Open popup dialog               ${btn_open_large_dialog}
    Verify that dialog is open      ${large_modal_dialog}
    Close popup dialog              ${btn_close_large_dialog}
    Verify that dialog is closed    ${large_modal_dialog}

Check whether user is able to close small popup dialog using cross button
    Open popup dialog               ${btn_open_small_dialog}
    Verify that dialog is open      ${small_modal_dialog}
    Close popup dialog              ${btn_close_cross}
    Verify that dialog is closed    ${small_modal_dialog}

Check whether user is able to close large popup dialog using cross button
    Open popup dialog               ${btn_open_large_dialog}
    Verify that dialog is open      ${large_modal_dialog}
    Close popup dialog              ${btn_close_cross}
    Verify that dialog is closed    ${large_modal_dialog}

Check whether clicking on the small dialog button opens popup dialogs related to this button
    Open popup dialog               ${btn_open_small_dialog}
    Verify that dialog is open      ${small_modal_dialog}
    Verify the title                ${text_small}

Check whether clicking on the large dialog button opens popup dialogs related to this button
    Open popup dialog               ${btn_open_large_dialog}
    Verify that dialog is open      ${large_modal_dialog}
    Verify the title                ${text_large}


