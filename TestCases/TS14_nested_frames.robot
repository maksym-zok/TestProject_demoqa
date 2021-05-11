*** Settings ***
Library                 BuiltIn
Library                 Collections
Library                 SeleniumLibrary
Resource                ../Bindings/keywords.robot
Resource                ../Resources/variables.robot
Resource                ../Resources/TS14_nested_frames_keywords.robot
Test Setup              Start browser and maximaze  https://demoqa.com/nestedframes
Test Teardown           close browser

*** Test Cases ***
Check whether frame contains another frame
    select frame                        ${frame_1}
    select frame                        ${frame_in_frame}

Check whether iframes not empty
    select frame                        ${frame_1}
    current frame should contain        ${parent_frame_txt}
    select frame                        ${frame_in_frame}
    current frame should contain        ${child_frame_txt}

