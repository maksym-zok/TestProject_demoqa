*** Settings ***
Library                 BuiltIn
Library                 Collections
Library                 SeleniumLibrary
Resource                ../Bindings/keywords.robot
Resource                ../Resources/variables.robot
Resource                ../Resources/TS18_date_picker_keywords.robot
Test Setup              Start browser and maximaze  https://demoqa.com/date-picker
Test Teardown           close browser

*** Test Cases ***
Check whether user is able to pick boundary values of months (1st 2nd 11th 12th) from date field
    FOR  ${res}  IN  1  2  11  12
            click element                       ${btn_select_date}
            select month                        ${MONTH}[${res}]
            select days                         ${DAYth}[01]    ${MONTH}[${res}]    2021
            wait until page contains element    ${output_select_date}'${res}/01/2021')]
    END
Check whether user is able to pick boundary values of years (1900 1901 2099 2100) from date field
    FOR  ${res}  IN  1900  1901  2099  2100
            click element                       ${btn_select_date}
            select month                        ${MONTH}[04]
            select year                         ${res}
            select days                         ${DAYth}[01]    ${MONTH}[04]    ${res}
            wait until page contains element    ${output_select_date}'04/01/${res}')]
    END

Check whether user is able to pick boundary values of days from date field
     Click on Select Date
     Select month                           ${MONTH}[2]
     Get the number of days                 ${output_number_of_days}'${MONTH}[2]')]
     FOR  ${day}     IN  1  2  ${days-1}   ${days}
         Click on Select Date
         Select days                        ${DAYth}[${day}]    ${MONTH}[2]    2021
         wait until page contains element   ${output_select_date}'${day}/2021')]
     END

Check whether user is able to input valid data to date field
    Clear Field of Characters               ${btn_select_date}
    Enter date to Select Date               ${valid_date}
    Verify valid date in Select Date        ${valid_date}

Check whether user is unable to input invalid data to date field
    Clear Field of Characters               ${btn_select_date}
    Enter date to Select Date               ${invalid_date}
    Verify invalid date in Select Date      ${invalid_date}

Check whether date field transforms invalid data with letters to original one
    ${real_date}         get value          ${btn_select_date}
    Clear Field Of Characters               ${btn_select_date}
    Enter date to Select Date               ${invalid_date_with_char}
    Verify valid date in Select Date        ${real_date}

Check whether user is able to pick boundary values of months (1st 2nd 11th 12th) in date and timefield
    FOR  ${res}  IN   1   2   11   12
            Click on Select date and time
            Click on the drop-down menu         ${btn_dropdown_month}
            Select month in dropdown            ${pick_month}'${MONTH}[${res}]']
            Select days                         ${DAYth}[01]    ${MONTH}[${res}]    2021
            Select time                         ${pick_time}'12:00']
            wait until page contains element    ${output_select_date_time}'${MONTH}[${res}]')]
    END

Check whether user is able to pick boundary values of days in date and time field
    Click on Select date and time
    Click on the drop-down menu         ${btn_dropdown_month}
    Select month in dropdown            ${pick_month}'${MONTH}[2]']
    Get the number of days              ${output_number_of_days}'${MONTH}[2]')]
    FOR  ${day}     IN  1  2  ${days-1}   ${days}
            Select days                        ${DAYth}[${day}]    ${MONTH}[2]    2021
            Select time                         ${pick_time}'12:00']
            wait until page contains element   ${output_select_date_time}'${MONTH}[2]')]
            Click on Select date and time
    END

Check whether user is able to pick boundary values of years (1900 1901 2099 2100) from date and time field

    Clear Field Of Characters           ${btn_select_date_time}
    Enter date to Select date and time  1902
    FOR  ${res}  IN   1900  1901
            Click on Select date and time
            Select year in date and time        ${res}
            select days                         ${DAYth}[01]    ${MONTH}[01]    ${res}
            Select time                         ${pick_time}'01:00']
            wait until page contains element    ${output_select_date_time}'${res}')]
    END
    Clear Field Of Characters           ${btn_select_date_time}
    Enter date to Select date and time  2098
    FOR  ${res}  IN   2099  2100
            Click on Select date and time
            Select year in date and time        ${res}
            select days                         ${DAYth}[01]    ${MONTH}[01]    ${res}
            Select time                         ${pick_time}'01:00']
            wait until page contains element    ${output_select_date_time}'${res}')]
    END

Check whether user is able to pick boundary values of time (00.00 00.15 23.30 23.45) from date and time field
    FOR  ${res}  IN  1  2  95  96
        IF  ${res} < 3
        ${rets}  evaluate  ${res}+48
        ELSE
        ${rets}  evaluate  ${res}-48
        END
            Click on Select date and time
            Select month from date and time     ${pick_month}'${MONTH}[01]']
            select days                         ${DAYth}[01]    ${MONTH}[01]    2021
            Select time                         ${pick_hours}'${HOURS}[${res}]')]
            wait until page contains element    ${output_select_date_time}'${HOURS}[${rets}]')]
    END

Check whether user is able to input valid data to date and time field
    Clear Field Of Characters                   ${btn_select_date_time}
    Enter date to Select date and time          ${valid_date_and_time}
    Verify valid date in Select Date and time   ${valid_date_and_time}

Check whether user is unable to input invalid data to date and time field
    Clear Field Of Characters                   ${btn_select_date_time}
    Enter date to Select date and time          ${invalid_date_and_time}
    Verify invalid date in Select Date and time   ${invalid_date_and_time}

Check whether date and time field transforms invalid data with letters to original one
    ${real_date}         get value              ${btn_select_date_time}
    Clear Field Of Characters                   ${btn_select_date_time}
    Enter date to Select date and time          ${invalid_date_and_time}
    Verify invalid date in Select Date and time   ${real_date}

Сheck whether date and time field converts an invalid 2 + digit word and numbers to a 2-digit valid word and numbers by taking the first symbols
    Clear Field Of Characters                   ${btn_select_date_time}
    Enter date to Select date and time          ${invalid_date_to_convert}
    Verify valid date in Select Date and time   ${valid_converted}