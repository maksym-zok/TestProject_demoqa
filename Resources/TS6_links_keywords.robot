*** Settings ***
Library                 SeleniumLibrary
Variables               ../PageObjects/Locators.py

*** Keywords ***

Click
    [Arguments]  ${link}
    click element   ${link}

Verify the site title
    ${WindowsHandles}               get window handles
    set selenium implicit wait      2
    title should be                 ${web_site_title}
    set global variable             ${WindowsHandles}

Verify that the page opened in new tab
    FOR    ${res}    IN   ${WindowsHandles}[0]   ${WindowsHandles}[1]
           should contain   ${WindowsHandles}    ${res}
    END

Verify that the page opened in new window
    FOR    ${res}    IN   ${WindowsHandles}[0]   ${WindowsHandles}[1]
           should contain   ${WindowsHandles}    ${res}
    END

Verify status code
    [Arguments]  ${code}
    wait until element contains     ${response_link}   ${code}