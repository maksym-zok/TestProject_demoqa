*** Settings ***
Library                 BuiltIn
Library                 RequestsLibrary
Library                 String
Library                 Collections
Library                 SeleniumLibrary
Library                 JSONLibrary
Library                 String
Resource                ../Bindings/keywords.robot
Resource                ../Resources/variables.robot
Test Setup              Start browser and maximaze  https://demoqa.com/books
Test Teardown           close all browsers

*** Test Cases ***
Check whether user is able to change number of rows on bookstore page
    wait until page contains element                //select[@aria-label="rows per page"]
    FOR    ${res}    IN     5  10  20  25  50  100
            select from list by value               //select[@aria-label="rows per page"]   ${res}
            ${count}        get element count       //div[@class="rt-tr-group"]
            ${res}          convert to integer      ${res}
            should be equal                         ${res}  ${count}
    END

Check whether the table displays the number of rows selected by the user after reloading the page
    wait until page contains element                //select[@aria-label="rows per page"]
    FOR    ${res}    IN     5  10  20  25  50  100
            select from list by value               //select[@aria-label="rows per page"]   ${res}
            reload page
            wait until page contains element        //div[@class="rt-tr-group"]
            ${count}        get element count       //div[@class="rt-tr-group"]
            ${res}          convert to integer      ${res}
            should be equal                         ${res}  ${count}
    END

Сheck that the table displays the relevant data when the user enters it in the search bar to find multiple items on the bookstore page
    ${key_word}                                     set variable                            Media
    wait until page contains element                //select[@aria-label="rows per page"]
    select from list by value                       //select[@aria-label="rows per page"]   100
    ${number_of_expected_results}                   get element count                       //div[@class="rt-tbody"]//*[contains(text(),'${key_word}')]
    input text                                      //input[@id="searchBox"]                ${key_word}
    ${number_of_actual_results}                     get element count                       //div[@class="action-buttons"]//a
    should be equal                                 ${number_of_expected_results}           ${number_of_actual_results}

Check that the table displays the relevant data when the user enters it in the search bar to find single item on the bookstore page
    ${key_word}                                     set variable                            Git Pocket Guide
    wait until page contains element                //select[@aria-label="rows per page"]
    select from list by value                       //select[@aria-label="rows per page"]   100
    ${number_of_expected_results}                   get element count                       //div[@class="rt-tbody"]//*[contains(text(),'${key_word}')]
    input text                                      //input[@id="searchBox"]                ${key_word}
    ${number_of_actual_results}                     get element count                       //div[@class="action-buttons"]//a
    should be equal                                 ${number_of_expected_results}           ${number_of_actual_results}

Check that the table doesnt display the relevant data when the user enters invalid keywords in the search bar on the bookstore page
    ${key_word}                                     set variable                            invalidwords_which_means_nothing
    wait until page contains element                //select[@aria-label="rows per page"]
    select from list by value                       //select[@aria-label="rows per page"]   100
    ${number_of_expected_results}                   get element count                       //div[@class="rt-tbody"]//*[contains(text(),'${key_word}')]
    input text                                      //input[@id="searchBox"]                ${key_word}
    ${number_of_actual_results}                     get element count                       //div[@class="action-buttons"]//a
    should be equal                                 ${number_of_expected_results}           ${number_of_actual_results}

Check that user is able to open the items of the table on the bookstore page when user is not logged in
    wait until page contains element                //div[@class="main-header" and text()="Book Store"]
    wait until page contains element                //div[@class="rt-tr-group"]//a
    FOR    ${res}    IN RANGE     1  4
            wait until page contains element        (//div[@class="rt-tr-group"]//a)[${res}]
            ${text}                 get text        (//div[@class="rt-tr-group"]//a)[${res}]
            click element                           (//div[@class="rt-tr-group"]//a)[${res}]
            wait until page contains element        //div[@id="title-wrapper"]//label[@id="userName-value"]
            ${text_title}           get text        //div[@id="title-wrapper"]//label[@id="userName-value"]
            should be equal as strings              ${text}                         ${text_title}
            go to                                   https://demoqa.com/books
    END

Check that user is unable to add items of the table on the bookstore page when user is not logged in
    wait until page contains element                //div[@class="main-header" and text()="Book Store"]
    wait until page contains element                //div[@class="rt-tr-group"]//a
    FOR    ${res}    IN RANGE     1  4
            wait until page contains element        (//div[@class="rt-tr-group"]//a)[${res}]
            ${text}                 get text        (//div[@class="rt-tr-group"]//a)[${res}]
            click element                           (//div[@class="rt-tr-group"]//a)[${res}]
            page should not contain button          //button[text()="Add To Your Collection"]
            go to                                   https://demoqa.com/books
    END

Check that the user can turn the page of the table when there are more items in the table than rows on the bookstore page
    wait until page contains element                //div[@class="rt-tr-group"]//a
    ${elements_count}                               get element count                       //div[@class="rt-tr-group"]//a
    IF  ${elements_count} > 5
        wait until page contains element            //select[@aria-label="rows per page"]
        select from list by value                   //select[@aria-label="rows per page"]   5
        element should be disabled                  //button[text()="Previous"]
        element should be enabled                   //button[text()="Next"]
        click element                               //button[text()="Next"]
        element should be disabled                  //button[text()="Next"]
        element should be enabled                   //button[text()="Previous"]
        click element                               //button[text()="Previous"]
        sleep   5
    ELSE
        log to console                              Not enough rows to check
    END

Check that the table displays the page number on which the user is located on the bookstore page
    wait until page contains element                //div[@class="rt-tr-group"]//a
    ${elements_count}                               get element count                       //div[@class="rt-tr-group"]//a
    IF  ${elements_count} > 5
        wait until page contains element            //select[@aria-label="rows per page"]
        select from list by value                   //select[@aria-label="rows per page"]   5
        element should be disabled                  //button[text()="Previous"]
        element should be enabled                   //button[text()="Next"]
        wait until page contains element            //input[@value="1"]
        click element                               //button[text()="Next"]
        element should be disabled                  //button[text()="Next"]
        wait until page contains element            //input[@value="2"]
        element should be enabled                   //button[text()="Previous"]
        click element                               //button[text()="Previous"]
        wait until page contains element            //input[@value="1"]
    ELSE
        log to console                              Not enough rows to check
    END

check whether the page number input field accepts numbers in the available range on the bookstore page
    wait until page contains element                //div[@class="rt-tr-group"]//a
    ${elements_count}                               get element count                       //div[@class="rt-tr-group"]//a
    IF  ${elements_count} > 5
        wait until page contains element            //select[@aria-label="rows per page"]
        select from list by value                   //select[@aria-label="rows per page"]   5
        ${upper_value}                              get text       //span[@class="-totalPages"]
        ${upper_value}                              convert to integer  ${upper_value}
        ${field}                                    set variable    //input[@aria-label="jump to page"]
        ${field text}                               Get Value       ${field}
        ${field text length}                        Get Length      ${field text}
        Clear rowField Of Characters                ${field}        ${field text length}
        Press Keys                                  ${field}        ${upper_value}
        click element                               //div[@class="input-group-append"]
        wait until page contains element            //input[@value="${upper_value}"]
        ${field text}                               Get Value       ${field}
        ${field text length}                        Get Length      ${field text}
        Clear rowField Of Characters                ${field}        ${field text length}
        Press Keys                                  ${field}        1
        click element                               //div[@class="input-group-append"]
        wait until page contains element            //input[@value="1"]
    ELSE
        log to console                              Not enough rows to check
    END


Check that the page number input field does not accept number outside the lower boundary value on the bookstore page
    wait until page contains element                //div[@class="rt-tr-group"]//a
    ${elements_count}                               get element count                       //div[@class="rt-tr-group"]//a
    IF  ${elements_count} > 5
        wait until page contains element            //select[@aria-label="rows per page"]
        select from list by value                   //select[@aria-label="rows per page"]   5
        ${lower_value}                              get value       //input[@aria-label="jump to page"]
        ${invalid_lower_value}                      evaluate        ${lower_value}-1
        ${field}                                    set variable    //input[@aria-label="jump to page"]
        ${field text}                               Get Value       ${field}
        ${field text length}                        Get Length      ${field text}
        Clear rowField Of Characters                ${field}        ${field text length}
        Press Keys                                  ${field}        ${invalid_lower_value}
        click element                               //div[@class="input-group-append"]
        should be equal                             ${lower_value}  1
    ELSE
        log to console                              Not enough rows to check
    END

Check that the page number input field does not accept number outside the upper boundary value on the bookstore page
    wait until page contains element                //div[@class="rt-tr-group"]//a
    ${elements_count}                               get element count                       //div[@class="rt-tr-group"]//a
    IF  ${elements_count} > 5
        wait until page contains element            //select[@aria-label="rows per page"]
        select from list by value                   //select[@aria-label="rows per page"]   5
        ${before_upper_value}                       get text       //span[@class="-totalPages"]
        ${before_upper_value}                       convert to integer  ${before_upper_value}
        ${invalid_upper_value}                      evaluate        ${before_upper_value}+1
        ${field}                                    set variable    //input[@aria-label="jump to page"]
        ${field text}                               Get Value       ${field}
        ${field text length}                        Get Length      ${field text}
        Clear rowField Of Characters                ${field}        ${field text length}
        Press Keys                                  ${field}        ${invalid_upper_value}
        click element                               //div[@class="input-group-append"]
        ${after_upper_value}                       get text       //span[@class="-totalPages"]
        ${after_upper_value}                       convert to integer  ${after_upper_value}
        should be equal                             ${before_upper_value}  ${after_upper_value}
    ELSE
        log to console                              Not enough rows to check
    END

Check whether user is able to login from the bookstore page
    wait until page contains element                //button[@id="login"]
    click button                                    //button[@id="login"]
    wait until page contains element                id:userName
    input text                  id:userName         ${existed_valid_username}
    input text                  id:password         ${existed_valid_pass}
    click button                id:login
    wait until location is                          https://demoqa.com/books

Check that the user able to log in from a table item on the bookstore page
    wait until page contains element                //div[@class="rt-tr-group"]//a
    click element                                   //div[@class="rt-tr-group"]//a
    wait until page contains element                //button[@id="login"]
    ${isbn_code}                get text            //div[@id="ISBN-wrapper"]//label[@id="userName-value"]
    click button                                    //button[@id="login"]
    wait until page contains element                id:userName
    input text                  id:userName         ${existed_valid_username}
    input text                  id:password         ${existed_valid_pass}
    click button                id:login
    wait until location is                          https://demoqa.com/books?book=${isbn_code}