*** Settings ***
Library                 BuiltIn
Library                 Collections
Library                 SeleniumLibrary
Resource                ../Bindings/keywords.robot
Resource                ../Resources/variables.robot
Resource                ../Resources/TS6_links_keywords.robot
Test Setup              Start browser and maximaze  https://demoqa.com/links
Test Teardown           close browser

*** Test Cases ***
Check whether link opens in a new tab on the same site
    Click               ${simple_link}
    Verify the site title
    Verify that the page opened in new tab
Check whether link opens in a new window on the same site
    Click               ${dynamic_link}
    Verify the site title
    Verify that the page opened in new window
Check whether link has response code 201
    Click               ${created_link}
    Verify status code  ${code_201}

Check whether link has response code 204
    Click               ${no_content_link}
    Verify status code  ${code_204}

Check whether link has response code 301
    Click               ${moved_link}
    Verify status code  ${code_301}

Check whether link has response code 400
    Click               ${bad_request_link}
    Verify status code  ${code_400}

Check whether link has response code 401
    Click               ${unauthorized_link}
    Verify status code  ${code_401}

Check whether link has response code 403
    Click               ${forbidden_link}
    Verify status code  ${code_403}

Check whether link has response code 404
    Click               ${invalid_link}
    Verify status code  ${code_404}