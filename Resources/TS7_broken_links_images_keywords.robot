*** Settings ***
Library                 SeleniumLibrary
Variables               ../PageObjects/Locators.py

*** Keywords ***
Click
    [Arguments]  ${link}
    click element   ${link}

Verify that image is visiable
    [Arguments]  ${image}
    page should contain image       ${image}

Verify the site title
    set selenium implicit wait      2
    title should be                 ${web_site_title}