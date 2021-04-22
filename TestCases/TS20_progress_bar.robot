*** Settings ***
Library                 BuiltIn
Library                 Collections
Library                 SeleniumLibrary
Resource                ../Bindings/keywords.robot
Resource                ../Resources/variables.robot
Test Setup              Start browser and maximaze  https://demoqa.com/progress-bar
Test Teardown           close browser

*** Test Cases ***
Check whether user can run the progress bar
    ${pre_value}                    get text                        //div[@class="progress-bar bg-info"]
    click button                    id:startStopButton
    wait until page contains element    //div[text()='100%']        11
    should not be equal             ${pre_value}                    100%

Check whether user can stop progress bar during the process
    ${expected_tens_value}          set variable                    4
    ${pre_value}                    get text                        //div[@class="progress-bar bg-info"]
    click button                    id:startStopButton
    sleep                           ${expected_tens_value}
    wait until page contains element    //div[text()='${expected_tens_value}0%']
    click button                    id:startStopButton
    ${current_value}                get text                        //div[@class="progress-bar bg-info"]
    should be equal                 ${current_value}                ${expected_tens_value}0%

Check whether Start button transforms to Reset button when the bar progress value is 100%
    page should contain button      id:startStopButton
    page should not contain button  id:resetButton
    ${pre_value}                    get text                        //div[@class="progress-bar bg-info"]
    click button                    id:startStopButton
    wait until page contains element    //div[text()='100%']        11
    should not be equal             ${pre_value}                    100%
    page should not contain button  id:startStopButton
    page should contain button      id:resetButton

Check whether progress bar is not able to have over 100% progress
    ${pre_value}                    get text                        //div[@class="progress-bar bg-info"]
    click button                    id:startStopButton
    wait until page contains element    //div[text()='100%']        11
    should not be equal             ${pre_value}                    100%
    sleep                           1
    page should contain element     //div[text()='100%']

Check whether Reset button returns the progress bar to 0%
    ${pre_value}                    get text                        //div[@class="progress-bar bg-info"]
    click button                    id:startStopButton
    wait until page contains element    //div[text()='100%']        11
    should not be equal             ${pre_value}                    100%
    click button                    id:resetButton
    page should contain element     //div[text()='0%']


