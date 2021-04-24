*** Settings ***
Library                 BuiltIn
Library                 Collections
Library                 RequestsLibrary
Library                 SeleniumLibrary
Resource                ../Bindings/keywords.robot
Resource                ../Resources/variables.robot
Test Setup              Start browser and maximaze  https://demoqa.com/text-box
Test Teardown           close browser

*** Test Cases ***
Text Box testing with valid data
    input
    When User Input valid username
    And Input valid email
    And Input valid current address
    And Input valid permanent address
    And Submit data in Text Box
    Then Inputted data corresponds to the data in the response
Text Box testing with invalid email
    When User Input valid username
    And Input invalid email
    And Input valid current address
    And Input valid permanent address
    And Submit data in Text Box
    element should not be visible  xpath://div[@class="border col-md-12 col-sm-12"]
Text Box testing with empty email field
    input text      id:userName                 ${valid_username}
    input text      id:userEmail                ${EMPTY}
    input text      id:currentAddress           ${valid_cur_address}
    input text      id:permanentAddress         ${valid_per_address}
    click element   id:submit
    element should not be visible  id:email
Text Box testing with empty username field
    input text      id:userName                 ${EMPTY}
    input text      id:userEmail                ${valid_email}
    input text      id:currentAddress           ${valid_cur_address}
    input text      id:permanentAddress         ${valid_per_address}
    click element   id:submit
    element should not be visible  id:name

Text Box testing with empty current address field
    input text      id:userName                 ${valid_username}
    input text      id:userEmail                ${valid_email}
    input text      id:permanentAddress         ${valid_per_address}
    click element   id:submit
    element should not be visible  //p[@id="currentAddress"]

Text Box testing with empty permanent address field
    input text      id:userName                 ${valid_username}
    input text      id:userEmail                ${valid_email}
    input text      id:currentAddress           ${valid_cur_address}
    click element   id:submit
    element should not be visible  //p[@id="permanentAddress"]