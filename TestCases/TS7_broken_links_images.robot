*** Settings ***
Library                 BuiltIn
Library                 Collections
Library                 SeleniumLibrary
Library                 RequestsLibrary
Resource                ../Bindings/keywords.robot
Resource                ../Resources/variables.robot
Test Setup              Start browser and maximaze  https://demoqa.com/broken
Test Teardown           close browser

*** Test Cases ***
Check whether images are visiable
    page should contain image     //div/img[@src="/images/Toolsqa.jpg"]
    page should contain image   //div/img[@src="/images/Toolsqa_1.jpg"]

Check whether "Click Here for Valid Link" is not broken
    click link  //*[text()='Click Here for Valid Link']
    set selenium implicit wait  2
    title should be        ToolsQA

Check whether "Click Here for Broken Link" is not broken
    click link  //*[text()='Click Here for Broken Link']
    set selenium implicit wait  2
    title should be        ToolsQA