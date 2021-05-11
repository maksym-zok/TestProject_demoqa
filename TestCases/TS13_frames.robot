*** Settings ***
Library                 BuiltIn
Library                 Collections
Library                 SeleniumLibrary
Resource                ../Bindings/keywords.robot
Resource                ../Resources/variables.robot
Resource                ../Resources/TS13_frames_keywords.robot
Test Setup              Start browser and maximaze  https://demoqa.com/frames
Test Teardown           close browser

*** Test Cases ***
Check whether 2 iframes are present on page
    Count frames
    Verify number of frames         ${frames}   2


Check whether iframes not empty
    Select frame                    ${frame_1}
    Current frame should contain    ${text_in_frame}
    Unselect frame
    Select frame                    ${frame_1}
    Current frame should contain    ${text_in_frame}

Check whether iframes have required size
    element attribute value should be   ${win_frame_1}  width   ${exp_frame1_width}
    element attribute value should be   ${win_frame_1}  height  ${exp_frame1_height}
    element attribute value should be   ${win_frame_2}  width   ${exp_frame2_width}
    element attribute value should be   ${win_frame_2}  height  ${exp_frame2_height}