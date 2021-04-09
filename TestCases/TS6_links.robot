*** Settings ***
Library                 BuiltIn
Library                 Collections
Library                 SeleniumLibrary
Resource                ../Bindings/keywords.robot
Resource                ../Resources/variables.robot
Test Setup              Start browser and maximaze  https://demoqa.com/links
Test Teardown           close browser

*** Test Cases ***
Check whether link opens in a new tab on the same site
    click element   id:simpleLink
    ${WindowsHandles}   get window handles
    set selenium implicit wait  2
    title should be        ToolsQA
    FOR    ${res}    IN   ${WindowsHandles}[0]   ${WindowsHandles}[1]
           should contain   ${WindowsHandles}    ${res}
    END
Check whether link opens in a new window on the same site
    click element   id:dynamicLink
    ${WindowsHandles}   get window handles
    set selenium implicit wait  2
    title should be        ToolsQA
    FOR    ${res}    IN   ${WindowsHandles}[0]   ${WindowsHandles}[1]
           should contain   ${WindowsHandles}    ${res}
    END
Check whether link has response code 201
    click element   id:created
    wait until element contains     id:linkResponse   Link has responded with staus 201 and status text Created

Check whether link has response code 204
    click element   id:no-content
    wait until element contains     id:linkResponse   Link has responded with staus 204 and status text No Content

Check whether link has response code 301
    click element   id:moved
    wait until element contains     id:linkResponse   Link has responded with staus 301 and status text Moved Permanently

Check whether link has response code 400
    click element   id:bad-request
    wait until element contains     id:linkResponse   Link has responded with staus 400 and status text Bad Request

Check whether link has response code 401
    click element   id:unauthorized
    wait until element contains     id:linkResponse   Link has responded with staus 401 and status text Unauthorized

Check whether link has response code 403
    click element   id:forbidden
    wait until element contains     id:linkResponse   Link has responded with staus 403 and status text Forbidden

Check whether link has response code 404
    click element   id:invalid-url
    wait until element contains     id:linkResponse   Link has responded with staus 404 and status text Not Found