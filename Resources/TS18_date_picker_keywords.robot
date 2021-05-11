*** Settings ***
Library                 BuiltIn
Library                 Collections
Library                 SeleniumLibrary
Variables               ../PageObjects/Locators.py

*** Keywords ***
Click on Select Date
    click element   ${btn_select_date}

Click on Select date and time
    click element   ${btn_select_date_time}

Click on the drop-down menu
    [Arguments]     ${locator}
    click element            ${locator}

Select month in dropdown
    [Arguments]     ${locator}
    click element   ${locator}

Select time
    [Arguments]     ${locator}
    click element   ${locator}

Select month
    [Arguments]     ${month}
    select from list by label       ${date_picker_month}            ${month}

Select month from date and time
    [Arguments]     ${month}
    click element                   ${btn_dropdown_month}
    click element                   ${month}

Select year
    [Arguments]     ${year}
    select from list by label       ${date_picker_year}             ${year}

#Select day
#    [Arguments]     ${day}  ${month}  ${year}
#    click element                   xpath://div[@aria-label="Choose Wednesday, ${month} ${day}, ${year}"]

Select days
    [Arguments]     ${day}  ${month}  ${year}
    click element                   //div[contains(@aria-label, '${month} ${day}, ${year}')]

Enter date to Select Date
    [Arguments]     ${date}
    Press Keys                      ${btn_select_date}        ${date}
    click element                   ${to_click}

Enter date to Select date and time
    [Arguments]  ${date}
    input text      ${btn_select_date_time}   ${date}
    press keys      ${btn_select_date_time}   ENTER

Select year in date and time
    [Arguments]  ${year}
    click element                       ${btn_dropdown_year}
    click element                       ${pick_year}'${year}']

Get the number of days
    [Arguments]     ${locator}
    ${days}         get element count       ${locator}
    ${days+1}       evaluate                ${days}+1
    ${days-1}       evaluate                ${days}-1
    set global variable  ${days}

Verify valid date in Select Date and time
    [Arguments]  ${inputed_date}
    wait until page contains element                ${btn_select_date_time}
    ${real_date}                    get value       ${btn_select_date_time}
    should be equal as strings      ${inputed_date}   ${real_date}

Verify invalid date in Select Date and time
    [Arguments]  ${inputed_date}
    wait until page contains element                ${btn_select_date_time}
    ${real_date}                    get value       ${btn_select_date_time}
    should not be equal as strings      ${inputed_date}   ${real_date}

Verify valid date in Select Date
    [Arguments]  ${inputed_date}
    wait until page contains element                ${btn_select_date}
    ${real_date}                    get value       ${btn_select_date}
    should be equal as strings      ${inputed_date}   ${real_date}

Verify invalid date in Select Date
    [Arguments]  ${inputed_date}
    ${real_date}                    get value       ${btn_select_date}
    should not be equal as strings      ${inputed_date}   ${real_date}

Clear Field Of Characters
    [Arguments]    ${field}
    ${field text}                 Get Value       ${field}
    ${character count}            Get Length      ${field text}
    FOR    ${index}    IN RANGE    ${character count}
        Press Keys    ${field}  BACKSPACE
    END