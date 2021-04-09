*** Settings ***
Library                 BuiltIn
Library                 Collections
Library                 SeleniumLibrary
Resource                ../Bindings/keywords.robot
Resource                ../Resources/variables.robot
Test Setup              Start browser and maximaze  https://demoqa.com/modal-dialogs
Test Teardown           close browser

*** Test Cases ***
Check whether popup dialogs are invisiable
    element should not be visible   //div[@aria-labelledby="example-modal-sizes-title-sm"]
    element should not be visible   //div[@aria-labelledby="example-modal-sizes-title-lg"]

Check whether popup dialogs are visible after click
    click element                   //button[text()='Small modal']
    wait until element is visible   //div[@aria-labelledby="example-modal-sizes-title-sm"]
    click element                   //span[text()='×']
    click element                   //button[text()='Large modal']
    wait until element is visible   //div[@aria-labelledby="example-modal-sizes-title-lg"]

Check whether popup dialogs are invisiable after clossing them
    click element                   //button[text()='Small modal']
    click button                    closeSmallModal
    wait until element is not visible   //div[@aria-labelledby="example-modal-sizes-title-sm"]
    click button                    //button[text()='Large modal']
    click button                    closeLargeModal
    wait until element is not visible   //div[@aria-labelledby="example-modal-sizes-title-lg"]

Check whether clicking on the buttons opens popup dialogs related to these buttons
    ${text_small}                   set variable                            Small
    wait until element contains     //button[@id="showSmallModal"]          ${text_small}
    click element                   //button[@id="showSmallModal"]
    wait until element contains     //div[@class="modal-title h4"]          ${text_small}
    click element                   //span[text()='×']
    ${text_large}                   set variable                            Large
    wait until element contains     //button[@id="showLargeModal"]          ${text_large}
    click element                   //button[@id="showLargeModal"]
    wait until element contains     //div[@class="modal-title h4"]          ${text_large}


