*** Settings ***
Library                 BuiltIn
Library                 Collections
Library                 SeleniumLibrary
Resource                ../Bindings/keywords.robot
Resource                ../Resources/variables.robot
Test Setup              Start browser and maximaze  https://demoqa.com/nestedframes
Test Teardown           close browser

*** Test Cases ***
Check whether iframes are present on page
    ${frames}                       get element count           //iframe
    log to console                  ${frames}
    ${ex_frames}                    set variable                2
    should be equal as integers     ${frames}                   ${ex_frames}

Check whether frame contains another frame
    select frame                    frame1
    select frame                    //body/iframe

Check whether iframes not empty
    select frame                    frame1
    current frame should contain    Parent frame
    select frame                    //body/iframe
    current frame should contain    Child Iframe

