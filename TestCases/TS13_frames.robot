*** Settings ***
Library                 BuiltIn
Library                 Collections
Library                 SeleniumLibrary
Resource                ../Bindings/keywords.robot
Resource                ../Resources/variables.robot
Test Setup              Start browser and maximaze  https://demoqa.com/frames
Test Teardown           close browser

*** Test Cases ***
Check whether 2 iframes are present on page
    ${frames}                       get element count           //iframe
    log to console                  ${frames}
    ${ex_frames}                    set variable                2
    should be equal as integers     ${frames}                   ${ex_frames}

Check whether iframes not empty
    select frame                    frame1
    current frame should contain    This is a sample page
    unselect frame
    select frame                    frame2
    current frame should contain    This is a sample page

Check whether iframes have required size
    ${frame1_width}                 get element attribute       //iframe[@id="frame1"]  width
    ${frame1_height}                get element attribute       //iframe[@id="frame1"]  height
    ${exp_frame1_width}             set variable                500px
    ${exp_frame1_height}            set variable                350px
    should be equal as strings      ${exp_frame1_width}         ${frame1_width}
    should be equal as strings      ${exp_frame1_height}        ${frame1_height}
    ${frame2_width}                 get element attribute       //iframe[@id="frame2"]  width
    ${frame2_height}                get element attribute       //iframe[@id="frame2"]  height
    ${exp_frame2_width}             set variable                100px
    ${exp_frame2_height}            set variable                100px
    should be equal as strings      ${exp_frame2_width}         ${frame2_width}
    should be equal as strings      ${exp_frame2_height}        ${frame2_height}