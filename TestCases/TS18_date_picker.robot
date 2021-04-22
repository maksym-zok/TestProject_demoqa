*** Settings ***
Library                 BuiltIn
Library                 Collections
Library                 SeleniumLibrary
Resource                ../Bindings/keywords.robot
Resource                ../Resources/variables.robot
Test Setup              Start browser and maximaze  https://demoqa.com/date-picker
Test Teardown           close browser

*** Test Cases ***
Check whether user is able to pick any available month from date field
    FOR  ${res}  IN RANGE   1   13
            click element                   //div[@id="datePickerMonthYear"]//input
            select month                    ${MONTH}[${res}]
            select days                     ${DAYth}[01]    ${MONTH}[${res}]    2021
            wait until page contains element    //input[contains(@value, '${res}/01/2021')]
    END
Check whether user is able to pick any available year from date field
    FOR  ${res}  IN RANGE   1900   2100
            click element                   //div[@id="datePickerMonthYear"]//input
            select month                    ${MONTH}[04]
            select year                     ${res}
            select days                     ${DAYth}[01]    ${MONTH}[04]    ${res}
            wait until page contains element    //input[contains(@value, '04/01/${res}')]
    END
Check whether user is able to pick any available day from date field
    FOR  ${res}  IN RANGE   1   13
            click element                   //div[@id="datePickerMonthYear"]//input
            select month                    ${MONTH}[${res}]
            ${days}                         get element count   //div[contains(@aria-label, '${MONTH}[${res}]')]
            ${days}                         evaluate             ${days}+1
                FOR  ${day}     IN RANGE  1  ${days}
                click element                   //div[@id="datePickerMonthYear"]//input
                select days                     ${DAYth}[${day}]    ${MONTH}[${res}]    2021
                wait until page contains element    //input[contains(@value, '${day}/2021')]
                END
    END

Check whether user is able to input valid data to date field
    ${valid_date}                   set variable    02/03/2021
    ${field}                        set variable    //div[@id="datePickerMonthYear"]//input
    ${field text}=                  Get Value       ${field}
    ${field text length}=           Get Length      ${field text}
    Clear Field of Characters       ${field}        ${field text length}
    Press Keys                      ${field}        ${valid_date}
    click element                   //div[text()='Select Date']
    ${real_date}                    get value       //div[@id="datePickerMonthYear"]//input
    should be equal as strings      ${valid_date}   ${real_date}

Check whether user is unable to input invalid data to date field
    ${invalid_date}                 set variable    40/40/22
    ${field}                        set variable    //div[@id="datePickerMonthYear"]//input
    ${field text}                   Get Value       ${field}
    ${field text length}            Get Length      ${field text}
    Clear Field of Characters       ${field}        ${field text length}
    Press Keys                      ${field}        ${invalid_date}
    click element                   //div[text()='Select Date']
    ${real_date}                    get value       //div[@id="datePickerMonthYear"]//input
    should not be equal as strings  ${invalid_date}   ${real_date}

Check whether date field transforms invalid data with letters to original one
    ${invalid_date}                 set variable    4kls0/40sdf0/22sd
    ${field}                        set variable    //div[@id="datePickerMonthYear"]//input
    ${field text}                   Get Value       ${field}
    ${field text length}            Get Length      ${field text}
    Clear Field of Characters       ${field}        ${field text length}
    Press Keys                      ${field}        ${invalid_date}
    click element                   //div[text()='Select Date']
    ${real_date}                    get value       //div[@id="datePickerMonthYear"]//input
    should be equal as strings      ${field text}   ${real_date}

Сheck whether date field transforms invalid 2+ digit number into two-digit valid one by taking first number
    ${invalid_date}                 set variable    900/900/440
    ${valid_one}                    set variable    09/09/2044
    ${field}                        set variable    //div[@id="datePickerMonthYear"]//input
    ${field text}                   Get Value       ${field}
    ${field text length}            Get Length      ${field text}
    Clear Field of Characters       ${field}        ${field text length}
    Press Keys                      ${field}        ${invalid_date}
    click element                   //div[text()='Select Date']
    ${real_date}                    get value       //div[@id="datePickerMonthYear"]//input
    should be equal as strings      ${valid_one}    ${real_date}

Check whether user is able to pick any available month in date and time field
    FOR  ${res}  IN RANGE   1   13
            click element                       //input[@id='dateAndTimePickerInput']
            click element                       //span[@class="react-datepicker__month-read-view--down-arrow"]
            click element                       //div[text()='${MONTH}[${res}]']
            select days                         ${DAYth}[01]    ${MONTH}[${res}]    2021
            click element                       //li[text()='12:00']
            wait until page contains element    //input[contains(@value, '${MONTH}[${res}] 1, 2021 12:00 PM')]
    END

Check whether user is able to pick any available day in date and time field
        FOR  ${res}  IN RANGE   1   13
            click element                       id:dateAndTimePickerInput
            click element                       //span[@class="react-datepicker__month-read-view--down-arrow"]
            click element                       //div[text()='${MONTH}[${res}]']
            ${days}        get element count    //div[contains(@aria-label, '${MONTH}[${res}]')]
            ${days}        evaluate             ${days}+1
                FOR  ${day}     IN RANGE  1  ${days}
                click element                   id:dateAndTimePickerInput
                select days                     ${DAYth}[${day}]    ${MONTH}[${res}]    2021
                click element                   //li[text()='01:00']
                wait until page contains element    //input[contains(@value, '${day}') and contains(@value, '1:00')]
                END
        END

Check whether user is able to pick any available year from date and time field
    ${valid_date}               set variable    April 13, 1900 10:11 AM
    ${field}                    set variable    id:dateAndTimePickerInput
    ${field text}               Get Value       ${field}
    ${field text length}        Get Length      ${field text}
    Clear Field of Characters   ${field}        ${field text length}
    input text      id:dateAndTimePickerInput   ${valid_date}
    FOR  ${res}  IN RANGE   1900  2100
            click element                       id:dateAndTimePickerInput
            click element                       //div[@class="react-datepicker__year-read-view"]
            click element                       //div[text()='${res}']
            select days                         ${DAYth}[01]    ${MONTH}[04]    ${res}
            click element                       //li[text()='01:00']
            wait until page contains element    //input[contains(@value, '${res}')]
    END

Check whether user is able to pick any available time in date and time field
        FOR  ${res}  IN RANGE  1   5
            ${rets}  evaluate  ${res}+48
                click element                       id:dateAndTimePickerInput
                click element                       //span[@class="react-datepicker__month-read-view--down-arrow"]
                click element                       //div[text()='${MONTH}[01]']
                select days                         ${DAYth}[01]    ${MONTH}[01]    2021
                click element                       //li[contains(text(), '${HOURS}[${res}]')]
                wait until page contains element    //input[contains(@value, '${HOURS}[${rets}]')]
        END
        FOR  ${res}  IN RANGE  5   97
            IF  ${res} < 53
                click element                       id:dateAndTimePickerInput
                click element                       //span[@class="react-datepicker__month-read-view--down-arrow"]
                click element                       //div[text()='${MONTH}[01]']
                select days                         ${DAYth}[01]    ${MONTH}[01]    2021
                click element                       //li[contains(text(), '${HOURS}[${res}]')]
                wait until page contains element    //input[contains(@value, '${HOURS}[${res}]')]
            ELSE
                ${rets}  evaluate  ${res}-48
                click element                       id:dateAndTimePickerInput
                click element                       //span[@class="react-datepicker__month-read-view--down-arrow"]
                click element                       //div[text()='${MONTH}[01]']
                select days                         ${DAYth}[01]    ${MONTH}[01]    2021
                click element                       //li[contains(text(), '${HOURS}[${res}]')]
                wait until page contains element    //input[contains(@value, '${HOURS}[${rets}]')]
            END
        END

Check whether user is able to input valid data to date and time field
    ${valid_date}               set variable    April 23, 2021 12:45 PM
    ${field}                    set variable    id:dateAndTimePickerInput
    ${field text}               Get Value       ${field}
    ${field text length}        Get Length      ${field text}
    Clear Field of Characters   ${field}        ${field text length}
    Press Keys                  ${field}        ${valid_date}
    click element               //div[text()='Select Date']
    ${real_date}                get value       id:dateAndTimePickerInput
    should be equal as strings  ${valid_date}   ${real_date}

Check whether user is unable to input invalid data to date and time field
    ${invalid_date}             set variable    Aprasdil 2as3, 202as1 12asd:45 Pvfd M
    ${field}                    set variable    id:dateAndTimePickerInput
    ${field text}               Get Value       ${field}
    ${field text length}        Get Length      ${field text}
    Clear Field of Characters   ${field}        ${field text length}
    Press Keys                  ${field}        ${invalid_date}
    click element               //div[text()='Select Date']
    ${real_date}                get value       id:dateAndTimePickerInput
    should not be equal as strings     ${invalid_date}   ${real_date}

Check whether date and time field transforms invalid data with letters to original one
    ${invalid_date}             set variable    klmaksldmlkamsd
    ${field}                    set variable    id:dateAndTimePickerInput
    ${field text}               Get Value       ${field}
    ${field text length}        Get Length      ${field text}
    Clear Field of Characters   ${field}        ${field text length}
    Press Keys                  ${field}        ${invalid_date}
    press keys                  ${field}        ENTER
    click element               //div[text()='Select Date']
    ${real_date}                get value       id:dateAndTimePickerInput
    should be equal as strings  ${field text}   ${real_date}

Сheck whether date and time field converts an invalid 2 + digit word and numbers to a 2-digit valid word and numbers by taking the first symbols
    ${invalid_date}             set variable    Apr 23, 21 12:45 PM
    ${valid_one}                set variable    April 23, 2021 12:45 PM
    ${field}                    set variable    id:dateAndTimePickerInput
    ${field text}               Get Value       ${field}
    ${field text length}        Get Length      ${field text}
    Clear Field of Characters   ${field}        ${field text length}
    Press Keys                  ${field}        ${invalid_date}
    click element               //div[text()='Select Date']
    ${real_date}                get value       id:dateAndTimePickerInput
    should be equal as strings  ${valid_one}    ${real_date}