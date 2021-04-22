*** Settings ***
Library                 BuiltIn
Library                 Collections
Library                 SeleniumLibrary
Resource                ../Bindings/keywords.robot
Resource                ../Resources/variables.robot
Test Setup              Start browser and maximaze  https://demoqa.com/login
Test Teardown           close browser

*** Test Cases ***
CHeck whether user is able to login using existing user data
    input text                  id:userName                     ${existed_valid_username}
    input text                  id:password                     ${existed_valid_pass}
    click button                id:login
    wait until page contains element                            //div[@class="main-header" and text()="Profile"]

Check whether user is unable to login using existing userName and invalid password
    input text                  id:userName                     ${existed_valid_username}
    input text                  id:password                     invalidpass
    click button                id:login
    wait until page contains element                            //p[text()="Invalid username or password!"]

Check whether user is unable to login using non-existent userName
    input text                  id:userName                     nonexistent
    input text                  id:password                     ${existed_valid_pass}
    click button                id:login
    wait until page contains element                            //p[text()="Invalid username or password!"]

Check whether user is unable to login leaving empty userName and password fields
    click button                id:login
    sleep                       1
    ${element_userName}         Get CSS Property Value          id:userName    border-color
    should be equal as strings  ${element_userName}             ${rgb_red}
    ${element_password}         Get CSS Property Value          id:password    border-color
    should be equal as strings  ${element_password}             ${rgb_red}

Check whether New User button redirect to registration page
    click button                id:newUser
    wait until page contains element                            //div[@class="main-header" and text()="Register"]