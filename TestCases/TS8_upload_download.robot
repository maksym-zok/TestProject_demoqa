*** Settings ***
Library                 BuiltIn
Library                 Collections
Library                 SeleniumLibrary
Library                 RequestsLibrary
Resource                ../Bindings/keywords.robot
Resource                ../Resources/variables.robot
Resource                ../Resources/TS8_upload_download_keywords.robot
Test Setup              Start browser and maximaze  https://demoqa.com/upload-download
Test Teardown           close browser

*** Test Cases ***

Check image uploading works
    Chose file to upload    ${img_to_upload}
    Verify uploaded file    ${filename}

#Check image downloading works
#    Click                   ${bownload_button}
