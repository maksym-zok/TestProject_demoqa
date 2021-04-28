*** Settings ***
Library                 BuiltIn
Library                 Collections
Library                 SeleniumLibrary
Library                 RequestsLibrary
Resource                ../Bindings/keywords.robot
Resource                ../Resources/variables.robot
Resource                ../Resources/TS7_broken_links_images_keywords.robot
Test Setup              Start browser and maximaze  https://demoqa.com/broken
Test Teardown           close browser

*** Test Cases ***
Check whether images are visiable
    Verify that image is visiable   ${img_valid}
    Verify that image is visiable   ${img_invalid}

Check whether "Click Here for Valid Link" is not broken
    Click                           ${valid_link}
    Verify the site title

Check whether "Click Here for Broken Link" is not broken
    Click                           ${broken_link}
    Verify the site title