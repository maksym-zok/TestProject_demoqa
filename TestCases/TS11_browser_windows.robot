*** Settings ***
Library                 BuiltIn
Library                 Collections
Library                 RequestsLibrary
Library                 SeleniumLibrary
Resource        ../Bindings/keywords.robot
Resource        ../Resources/variables.robot
Test Setup              Start browser and maximaze  https://demoqa.com/browser-windows
Test Teardown           close browser

*** Test Cases ***
Check whether button opens new tab
    ${current}      get window handles
    log to console  ${current}
    click button    id:tabButton
    ${next}         get window handles
    log to console  ${next}
    should not be equal     ${current}  ${next}

Check whether button opens new window
    ${current}      get window handles
    log to console  ${current}
    click button    id:windowButton
    ${next}         get window handles
    log to console  ${next}
    should not be equal     ${current}  ${next}

#Check_whether_button_opens_aboutblank_window
#    open browser    ${base_url}   ${browser}
#    click element   ${alerts_frame}
#    click element   ${browser_windows}
#    click button    xpath://button[@id='messageWindowButton']
#    switch window   url=https://demoqa.com/browser-windows
#    switch window   url=about:blank
#    close browser