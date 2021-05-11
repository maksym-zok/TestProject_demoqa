*** Settings ***
Library                 BuiltIn
Library                 Collections
Library                 SeleniumLibrary
Resource                ../Bindings/keywords.robot
Resource                ../Resources/variables.robot
Resource                ../Resources/TS20_progress_bar_keywords.robot
Test Setup              Start browser and maximaze  https://demoqa.com/progress-bar
Test Teardown           close browser

*** Test Cases ***
Check whether user can run the progress bar
    Click Start
    Sleep                                   10
    Page should contain element             ${output_value_100}
    Verify progress bar value has changed   ${100%}

Check whether user can stop progress bar during the process
    Click Start
    Sleep                                   4
    Click Stop
    Page should contain element             ${output_value_40}
    Verify progress bar value has changed   ${40%}

Check whether Start button transforms to Reset button when the bar progress value is 100%
    Page should contain button              ${btn_start_stop}
    page should not contain button          ${btn_reset}
    Click Start
    Sleep                                   10
    Page should contain element             ${output_value_100}
    Verify progress bar value has changed   ${100%}
    page should not contain button          ${btn_start_stop}
    page should contain button              ${btn_reset}

Check whether progress bar is not able to have over 100% progress
    Click Start
    Sleep                                   11
    Page should contain element             ${output_value_100}
    Verify progress bar value has changed   ${100%}

Check whether Reset button returns the progress bar to 0%
    Click Start
    Sleep                                   10
    Page should contain element             ${output_value_100}
    Verify progress bar value has changed   ${100%}
    Click Reset
    Verify progress bar value has changed   ${0%}


