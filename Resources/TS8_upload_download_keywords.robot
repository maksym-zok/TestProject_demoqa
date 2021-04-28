*** Settings ***
Library                 SeleniumLibrary
Variables               ../PageObjects/Locators.py

*** Keywords ***
Chose file to upload
    [Arguments]  ${AddFile}
    Wait Until Page Contains Element    ${UploadFiletest}       60s
    Scroll Element Into View            ${UploadFiletest}
    Choose File                         ${UploadFiletest}       ${AddFile}

Verify uploaded file
    [Arguments]  ${filename}
    wait until element contains         ${path_upload}     ${filename}

Click
    [Arguments]  ${link}
    click element   ${link}