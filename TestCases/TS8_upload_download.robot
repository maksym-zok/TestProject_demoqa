*** Settings ***
Library                 BuiltIn
Library                 Collections
Library                 SeleniumLibrary
Library                 RequestsLibrary
Resource                ../Bindings/keywords.robot
Resource                ../Resources/variables.robot
Test Setup              Start browser and maximaze  https://demoqa.com/upload-download
Test Teardown           close browser

*** Variables ***
${UploadFiletest}           xpath://*[@type='file']
${AddFile}          D:/download.jpg

*** Test Cases ***
Check image uploading works

    Wait Until Page Contains Element   ${UploadFiletest}   60s
    Scroll Element Into View     ${UploadFiletest}
    Choose File     ${UploadFiletest}     ${AddFile}
    ${filename}     convert to string   C:\\fakepath\\download.jpg
    wait until element contains     id:uploadedFilePath   ${filename}

Check image downloading works
    click link      id:downloadButton
