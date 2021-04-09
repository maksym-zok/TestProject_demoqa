*** Settings ***
Library                 BuiltIn
Library                 Collections
Library                 SeleniumLibrary
Resource                ../Bindings/keywords.robot
Resource                ../Resources/variables.robot
Test Setup              Start browser and maximaze  https://demoqa.com/nestedframes
Test Teardown           close browser

*** Test Cases ***
Check whether frame contains another frame
    select frame                        frame1
    select frame                        //body/iframe

Check whether iframes not empty
    select frame                        frame1
    current frame should contain        Parent frame
    select frame                        //body/iframe
    current frame should contain        Child Iframe

