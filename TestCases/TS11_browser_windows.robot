*** Settings ***
Library                 BuiltIn
Library                 Collections
Library                 RequestsLibrary
Library                 SeleniumLibrary
Resource                ../Bindings/keywords.robot
Resource                ../Resources/variables.robot
Resource                ../Resources/TS11_browser_windows_keywords.robot
Test Setup              Start browser and maximaze  https://demoqa.com/browser-windows
Test Teardown           close browser

*** Test Cases ***
Check whether button opens new tab
    ${current}                      get window handles
    Click button                    ${btn_new_tab}
    ${next}                         get window handles
    Verify tabs                     ${current}  ${next}

Check whether button opens new window
    ${current}                      get window handles
    Click button                    ${btn_new_window}
    ${next}                         get window handles
    Verify windows                  ${current}  ${next}

Check whether button opens aboutblank window
    Click button                    ${btn_new_window_about_blank}
    ${WindowsHandles}               get window handles
    switch window                   ${WindowsHandles}[1]
    Title should be                 ${EMPTY}