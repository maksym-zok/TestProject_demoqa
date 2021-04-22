*** Settings ***
Library                 BuiltIn
Library                 Collections
Library                 SeleniumLibrary
Resource                ../Bindings/keywords.robot
Resource                ../Resources/variables.robot
Test Setup              Start browser and maximaze  https://demoqa.com/login
Test Teardown           close browser

*** Test Cases ***
CHeck whether user is able to registrate using valid data
    click button                id:newUser
    input text                  id:firstname                    maksym
    input text                  id:lastname                     max
    input text                  id:userName                     MAXIMmax123as
    input text                  id:password                     MAXIMmax123!
    click button                id:register
    alert should be present     User Register Successfully.     ACCEPT

CHeck whether user is able to registrate using the name of an existing userName
    click button                id:newUser
    input text                  id:firstname                    maksym
    input text                  id:lastname                     max
    input text                  id:userName                     MAXIMmax123as
    input text                  id:password                     MAXIMmax123!
    click button                id:register
    element text should be      //p[@id="name"]                 User exists!

User registration with a space instead of a firstname
    click button                id:newUser
    input text                  id:firstname                    ${SPACE}
    input text                  id:lastname                     max
    input text                  id:userName                     MAXIMmax123sd
    input text                  id:password                     MAXIMmax123!
    click button                id:register
    sleep                       1
    ${element_white}            Get CSS Property Value          id:firstname    border-color
    should be equal as strings  ${element_white}                ${rgb_red}

Check whether user is unable to registrate with a space instead of a lastname
    click button                id:newUser
    input text                  id:firstname                    max
    input text                  id:lastname                     ${SPACE}
    input text                  id:userName                     MAXIMmax123fg
    input text                  id:password                     MAXIMmax123!
    click button                id:register
    sleep                       1
    ${element_white}            Get CSS Property Value          id:lastname    border-color
    should be equal as strings  ${element_white}                ${rgb_red}

Check whether user is unable to registrate with a space instead of a userName
    click button                id:newUser
    input text                  id:firstname                    maaxks
    input text                  id:lastname                     max
    input text                  id:userName                     ${SPACE}
    input text                  id:password                     MAXIMmax123!
    click button                id:register
    sleep                       1
    ${element_white}            Get CSS Property Value          id:userName    border-color
    should be equal as strings  ${element_white}                ${rgb_red}

Check whether user is unable to registrate with a space instead of a password
    click button                id:newUser
    input text                  id:firstname                    maaxks
    input text                  id:lastname                     max
    input text                  id:userName                     MAXIMmax123!ld
    input text                  id:password                     ${SPACE}
    click button                id:register
    sleep                       1
    ${element_white}            Get CSS Property Value          id:password    border-color
    should be equal as strings  ${element_white}                ${rgb_red}

Check whether user is unable to registrate with an empty firstname field
    click button                id:newUser
    input text                  id:firstname                    ${EMPTY}
    input text                  id:lastname                     max
    input text                  id:userName                     MAXIMmax123!lk
    input text                  id:password                     MAXIMmax123!
    click button                id:register
    sleep                       1
    ${element_white}            Get CSS Property Value          id:firstname    border-color
    should be equal as strings  ${element_white}                ${rgb_red}

Check whether user is unable to registrate with an empty lastname field
    click button                id:newUser
    input text                  id:firstname                    max
    input text                  id:lastname                     ${EMPTY}
    input text                  id:userName                     MAXIMmax123owq
    input text                  id:password                     MAXIMmax123!
    click button                id:register
    sleep                       1
    ${element_white}            Get CSS Property Value          id:lastname    border-color
    should be equal as strings  ${element_white}                ${rgb_red}

Check whether user is unable to registrate with an empty userName field
    click button                id:newUser
    input text                  id:firstname                    maaxks
    input text                  id:lastname                     max
    input text                  id:userName                     ${EMPTY}
    input text                  id:password                     MAXIMmax123!
    click button                id:register
    sleep                       1
    ${element_white}            Get CSS Property Value          id:userName    border-color
    should be equal as strings  ${element_white}                ${rgb_red}

Check whether user is unable to registrate with an empty password field
    click button                id:newUser
    input text                  id:firstname                    maaxks
    input text                  id:lastname                     max
    input text                  id:userName                     MAXIMmax123!16
    input text                  id:password                     ${EMPTY}
    click button                id:register
    sleep                       1
    ${element_white}            Get CSS Property Value          id:password    border-color
    should be equal as strings  ${element_white}                ${rgb_red}

Check whether user is able to registrate with a 1-character firstname
    click button                id:newUser
    input text                  id:firstname                    M
    input text                  id:lastname                     max
    input text                  id:userName                     MAXIMmax123!lk1
    input text                  id:password                     MAXIMmax123!
    click button                id:register
    alert should be present     User Register Successfully.     ACCEPT

Check whether user is able to registrate with a 1-character lastname
    click button                id:newUser
    input text                  id:firstname                    Max
    input text                  id:lastname                     M
    input text                  id:userName                     MAXIMmax123!lk2
    input text                  id:password                     MAXIMmax123!
    click button                id:register
    alert should be present     User Register Successfully.     ACCEPT

Check whether user is able to registrate with a 1-character username
    click button                id:newUser
    input text                  id:firstname                    Max
    input text                  id:lastname                     Mass
    input text                  id:userName                     M
    input text                  id:password                     MAXIMmax123!
    click button                id:register
    alert should be present     User Register Successfully.     ACCEPT

Check whether user is unable to registrate with a 1-character password
    click button                id:newUser
    input text                  id:firstname                    Max
    input text                  id:lastname                     Mass
    input text                  id:userName                     Mlaaa
    input text                  id:password                     1
    click button                id:register
    element text should be      //p[@id="name"]                 Passwords must have at least one non alphanumeric character, one digit ('0'-'9'), one uppercase ('A'-'Z'), one lowercase ('a'-'z'), one special character and Password must be eight characters or longer.

Check whether user is unable to registrate with an invalid password
    click button                id:newUser
    input text                  id:firstname                    maaxks
    input text                  id:lastname                     max
    input text                  id:userName                     MAXIMmass
    input text                  id:password                     invalidpass
    click button                id:register
    element text should be      //p[@id="name"]                 Passwords must have at least one non alphanumeric character, one digit ('0'-'9'), one uppercase ('A'-'Z'), one lowercase ('a'-'z'), one special character and Password must be eight characters or longer.

Check whether user is able to registrate with a 255-characters firstname
    click button                id:newUser
    input text                  id:firstname                    ${validusername255char}
    input text                  id:lastname                     max
    input text                  id:userName                     AXIMmass
    input text                  id:password                     MAXIMmax123!
    click button                id:register
    alert should be present     User Register Successfully.     ACCEPT

Check whether user is unable to registrate with a 256-characters firstname
    click button                id:newUser
    input text                  id:firstname                    ${invalidusername256char}
    input text                  id:lastname                     max
    input text                  id:userName                     MAXIMm
    input text                  id:password                     MAXIMmax123!
    click button                id:register
    alert should not be present     action=ACCEPT               timeout=2s

Check whether user is able to registrate with a 255-characters lastname
    click button                id:newUser
    input text                  id:firstname                    MAX
    input text                  id:lastname                     ${validusername255char}
    input text                  id:userName                     MAXMma5
    input text                  id:password                     MAXIMmax123!
    click button                id:register
    alert should be present     User Register Successfully.     ACCEPT

Check whether user is unable to registrate with a 256-characters lastname
    click button                id:newUser
    input text                  id:firstname                    Max
    input text                  id:lastname                     ${invalidusername256char}
    input text                  id:userName                     MAXIMma8
    input text                  id:password                     MAXIMmax123!
    click button                id:register
    alert should not be present     action=ACCEPT               timeout=2s

Check whether user is able to registrate with a 255-characters userName
    click button                id:newUser
    input text                  id:firstname                    MAX
    input text                  id:lastname                     max
    input text                  id:userName                     ${validusername255char}
    input text                  id:password                     MAXIMmax123!
    click button                id:register
    alert should be present     User Register Successfully.     ACCEPT

Check whether user is unable to registrate with a 256-characters userName
    click button                id:newUser
    input text                  id:firstname                    Max
    input text                  id:lastname                     max
    input text                  id:userName                     ${invalidusername256char}
    input text                  id:password                     MAXIMmax123!
    click button                id:register
    alert should not be present     action=ACCEPT               timeout=2s

Check whether user is able to registrate with a 255-characters password
    click button                id:newUser
    input text                  id:firstname                    MAX
    input text                  id:lastname                     max
    input text                  id:userName                     max21
    input text                  id:password                     ${validpass255char}
    click button                id:register
    alert should be present     User Register Successfully.     ACCEPT

Check whether user is unable to registrate with a 256-characters password
    click button                id:newUser
    input text                  id:firstname                    Max
    input text                  id:lastname                     max
    input text                  id:userName                     username2
    input text                  id:password                     ${invalidpass256char}
    click button                id:register
    alert should not be present     action=ACCEPT               timeout=2s