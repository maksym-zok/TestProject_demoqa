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
Test Setup              Start browser and maximaze  https://demoqa.com/login
Test Teardown           close all browsers

*** Test Cases ***
CHeck whether user is able to logout when user is logged in
    Login                                           ${existed_valid_username}        ${existed_valid_pass}
    wait until page contains element                //button[@id="submit" and text()='Log out']
    click button                                    //button[@id="submit" and text()='Log out']
    wait until page contains element                //div[@class="main-header" and text()="Login"]

Check whether user is able to go to Book Store when user is logged in
    Login                                           ${existed_valid_username}        ${existed_valid_pass}
    wait until page contains element                //button[@id="gotoStore"]
    click button                                    //button[@id="gotoStore"]
    wait until page contains element                //div[@class="main-header" and text()="Book Store"]

Check whether user is able to add books to collection from Book Store when user is logged in
    Authorization and deleting collection           ${existed_valid_username}        ${existed_valid_pass}  ${existed_valid_userid}
    Login                                           ${existed_valid_username}        ${existed_valid_pass}
    wait until page contains element                //button[@id="gotoStore"]
    click button                                    //button[@id="gotoStore"]
    wait until page contains element                //div[@class="main-header" and text()="Book Store"]
    wait until page contains element                //div[@class="rt-tr-group"]//a
    FOR    ${res}    IN RANGE     1  4
            wait until page contains element        (//div[@class="rt-tr-group"]//a)[${res}]
            ${text}                 get text        (//div[@class="rt-tr-group"]//a)[${res}]
            click element                           (//div[@class="rt-tr-group"]//a)[${res}]
            wait until page contains element        //div[@id="title-wrapper"]//label[@id="userName-value"]
            ${text_title}           get text        //div[@id="title-wrapper"]//label[@id="userName-value"]
            should be equal as strings              ${text}                         ${text_title}
            click element                           //button[@id="addNewRecordButton" and text()="Add To Your Collection"]
            alert should be present                 Book added to your collection.  ACCEPT
            go to                                   https://demoqa.com/profile
            wait until page contains element        (//div[@class="rt-tr-group"]//a)[${res}]
            ${text_profile}         get text        (//div[@class="rt-tr-group"]//a)[${res}]
            should be equal as strings              ${text_profile}                 ${text_title}
            go to                                   https://demoqa.com/books
    END
    Authorization and deleting collection           ${existed_valid_username}        ${existed_valid_pass}    ${existed_valid_userid}

#Check whether user is able to turn the page of the table when user added more books than rows on profile page
#    Authorization and adding books to collection    ${existed_valid_username}       ${existed_valid_pass}    ${existed_valid_userid}
#    Login                                           ${existed_valid_username}       ${existed_valid_pass}
#    wait until page contains element                //button[text()="Previous"]
#    wait until page contains element                //button[text()="Next"]
#    element should be disabled                      //button[text()="Previous"]
#    element should be enabled                       //button[text()="Next"]
#    click element                                   //button[text()="Next"]
#    element should be disabled                      //button[text()="Next"]
#    element should be enabled                       //button[text()="Previous"]
#    click element                                   //button[text()="Previous"]
#    Authorization and deleting collection           ${existed_valid_username}       ${existed_valid_pass}   ${existed_valid_userid}

Check whether user is able to cancel deleting account when user is logged in
    Login                                           ${existed_valid_username}       ${existed_valid_pass}
    wait until page contains element                //button[@id="submit" and text()='Log out']
    click button                                    //button[@id="submit" and text()='Delete Account']
    wait until page contains element                //button[@id="closeSmallModal-cancel"]
    click button                                    //button[@id="closeSmallModal-cancel"]
    alert should not be present                     action=ACCEPT                   timeout=2s

CHeck whether user is able to delete account when user is logged in
    Creating account and authorization              ${deleted_username}             ${deleted_pass}
    Login                                           ${deleted_username}             ${deleted_pass}
    wait until page contains element                //button[@id="submit" and text()='Log out']
    click button                                    //button[@id="submit" and text()='Delete Account']
    wait until page contains element                //button[@id="closeSmallModal-ok"]
    click button                                    //button[@id="closeSmallModal-ok"]
    alert should be present                         User Deleted.                   ACCEPT
    wait until page contains element                //div[@class="main-header" and text()="Login"]

Check whether user is unable to login to deleted account
    Creating and deleting account                   ${willbedeleted_username}       ${willbedeleted_pass}
    Logining deleted user                           ${willbedeleted_username}       ${willbedeleted_pass}
    wait until page contains element                //p[text()='Invalid username or password!']

Check whether user is able to delete book collection when user is logged in
    Authorization and adding books to collection    ${existed_valid_username}        ${existed_valid_pass}  ${existed_valid_userid}
    Login                                           ${existed_valid_username}        ${existed_valid_pass}
    wait until page contains element                //button[text()='Delete All Books']
    execute javascript                              window.scrollTo(0,document.body.scrollHeight)
    click element                                   //button[text()='Delete All Books']
    wait until page contains element                //button[text()='OK']
    click button                                    //button[text()='OK']
    alert should be present                         All Books deleted.                  ACCEPT
    page should not contain link                    //div[@class="action-buttons"]//a
    Authorization and deleting collection           ${existed_valid_username}        ${existed_valid_pass}  ${existed_valid_userid}

Check whether user is able to cancel deleting book collection when user is logged in
    Authorization and adding books to collection    ${existed_valid_username}        ${existed_valid_pass}  ${existed_valid_userid}
    Login                                           ${existed_valid_username}        ${existed_valid_pass}
    wait until page contains element                //button[text()='Delete All Books']
    execute javascript                              window.scrollTo(0,document.body.scrollHeight)
    click element                                   //button[text()='Delete All Books']
    page should contain element                     //button[text()='Cancel']
    click button                                    //button[text()='Cancel']
    element text should not be                      //div[@class="action-buttons"]//a   ${EMPTY}
    Authorization and deleting collection           ${existed_valid_username}        ${existed_valid_pass}  ${existed_valid_userid}

Check that the system shows a pop-up message that there are nothing to delete in the collection when the user deletes an empty collection and logged in
    Authorization and deleting collection           ${existed_valid_username}        ${existed_valid_pass}  ${existed_valid_userid}
    Login                                           ${existed_valid_username}        ${existed_valid_pass}
    wait until page does not contain element        //div[@class="action-buttons"]//a
    wait until page contains element                //button[text()='Delete All Books']
    click element                                   //button[text()='Delete All Books']
    wait until page contains element                //button[text()='OK']
    click button                                    //button[text()='OK']
    alert should be present                         No books available in your's collection!                  ACCEPT
    wait until page does not contain element        //div[@class="action-buttons"]//a

Check whether user is able to change number of rows on profile page when user is logged in
    Login                                           ${deleted_username}                 ${deleted_pass}
    wait until page contains element                //select[@aria-label="rows per page"]
    FOR    ${res}    IN     5  10  20  25  50  100
            select from list by value               //select[@aria-label="rows per page"]   ${res}
            ${count}        get element count       //div[@class="rt-tr-group"]
            ${res}          convert to integer      ${res}
            should be equal                         ${res}  ${count}
    END

Check whether the table displays the number of rows selected by the user after reloading the page
    Login                                           ${deleted_username}             ${deleted_pass}
    wait until page contains element                //select[@aria-label="rows per page"]
    FOR    ${res}    IN     5  10  20  25  50  100
            select from list by value               //select[@aria-label="rows per page"]   ${res}
            reload page
            wait until page contains element        //div[@class="rt-tr-group"]
            ${count}        get element count       //div[@class="rt-tr-group"]
            ${res}          convert to integer      ${res}
            should be equal                         ${res}  ${count}
    END

Сheck that the table displays the relevant data when the user enters it in the search bar to find multiple items on the profile page
    Authorization and adding books to collection    ${existed_valid_username}               ${existed_valid_pass}  ${existed_valid_userid}
    Login                                           ${existed_valid_username}               ${existed_valid_pass}
    ${key_word}                                     set variable                            Media
    wait until page contains element                //select[@aria-label="rows per page"]
    select from list by value                       //select[@aria-label="rows per page"]   100
    ${number_of_expected_results}                   get element count                       //div[contains(text(),'${key_word}')]
    input text                                      //input[@id="searchBox"]                ${key_word}
    ${number_of_actual_results}                     get element count                       //div[@class="action-buttons"]//a
    should be equal                                 ${number_of_expected_results}           ${number_of_actual_results}
    Authorization and deleting collection           ${existed_valid_username}               ${existed_valid_pass}  ${existed_valid_userid}

Check that the table displays the relevant data when the user enters it in the search bar to find single item on the profile page
    Authorization and adding books to collection    ${existed_valid_username}               ${existed_valid_pass}  ${existed_valid_userid}
    Login                                           ${existed_valid_username}               ${existed_valid_pass}
    ${key_word}                                     set variable                            Git Pocket Guide
    wait until page contains element                //select[@aria-label="rows per page"]
    select from list by value                       //select[@aria-label="rows per page"]   100
    ${number_of_expected_results}                   get element count                       //div[@class="rt-tbody"]//*[contains(text(),'${key_word}')]
    input text                                      //input[@id="searchBox"]                ${key_word}
    ${number_of_actual_results}                     get element count                       //div[@class="action-buttons"]//a
    should be equal                                 ${number_of_expected_results}           ${number_of_actual_results}
    Authorization and deleting collection           ${existed_valid_username}               ${existed_valid_pass}  ${existed_valid_userid}

Check that the table doesnt display the relevant data when the user enters invalid keywords in the search bar on the profile page
    Authorization and adding books to collection    ${existed_valid_username}               ${existed_valid_pass}  ${existed_valid_userid}
    Login                                           ${existed_valid_username}               ${existed_valid_pass}
    ${key_word}                                     set variable                            invalidwords_which_means_nothing
    wait until page contains element                //select[@aria-label="rows per page"]
    select from list by value                       //select[@aria-label="rows per page"]   100
    ${number_of_expected_results}                   get element count                       //div[@class="rt-tbody"]//*[contains(text(),'${key_word}')]
    input text                                      //input[@id="searchBox"]                ${key_word}
    ${number_of_actual_results}                     get element count                       //div[@class="action-buttons"]//a
    should be equal                                 ${number_of_expected_results}           ${number_of_actual_results}
    Authorization and deleting collection           ${existed_valid_username}               ${existed_valid_pass}  ${existed_valid_userid}

Check that system logs out if the user logs in with the same credentials in new session
    [Setup]  Authorization                          ${existed_valid_username}               ${existed_valid_pass}  ${existed_valid_userid}
    open browser                                    https://demoqa.com/login                chrome                 alias=window_alias_1
    Login                                           ${existed_valid_username}               ${existed_valid_pass}
    wait until page contains element                //button[@id="submit" and text()='Log out']
    open browser                                    https://demoqa.com/login                chrome                 alias=window_alias_2
    Login                                           ${existed_valid_username}               ${existed_valid_pass}
    wait until page contains element                //button[@id="submit" and text()='Log out']
    switch browser                                  window_alias_1
    go to                                           https://demoqa.com/login
    wait until page contains element                //div/*[contains(text(),'Welcome') or contains(text(),'Login in Book Store')]

Check that the user can turn the page of the table when there are more items in the table than rows on the profile page
    Authorization and adding books to collection    ${existed_valid_username}               ${existed_valid_pass}  ${existed_valid_userid}
    Login                                           ${existed_valid_username}               ${existed_valid_pass}
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
    Authorization and deleting collection           ${existed_valid_username}               ${existed_valid_pass}  ${existed_valid_userid}

Check that the table displays the page number on which the user is located on the profile page
    Authorization and adding books to collection    ${existed_valid_username}               ${existed_valid_pass}  ${existed_valid_userid}
    Login                                           ${existed_valid_username}               ${existed_valid_pass}
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
    Authorization and deleting collection           ${existed_valid_username}               ${existed_valid_pass}  ${existed_valid_userid}

Check whether the page number input field accepts numbers in the available range on the profile page
    Authorization and adding books to collection    ${existed_valid_username}               ${existed_valid_pass}  ${existed_valid_userid}
    Login                                           ${existed_valid_username}               ${existed_valid_pass}
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
    Authorization and deleting collection           ${existed_valid_username}               ${existed_valid_pass}  ${existed_valid_userid}

Check that the page number input field does not accept number outside the lower boundary value on the profile page
    Authorization and adding books to collection    ${existed_valid_username}               ${existed_valid_pass}  ${existed_valid_userid}
    Login                                           ${existed_valid_username}               ${existed_valid_pass}
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
    Authorization and deleting collection           ${existed_valid_username}               ${existed_valid_pass}  ${existed_valid_userid}

Check that the page number input field does not accept number outside the upper boundary value on the profile page
    Authorization and adding books to collection    ${existed_valid_username}               ${existed_valid_pass}  ${existed_valid_userid}
    Login                                           ${existed_valid_username}               ${existed_valid_pass}
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
    Authorization and deleting collection           ${existed_valid_username}               ${existed_valid_pass}  ${existed_valid_userid}
