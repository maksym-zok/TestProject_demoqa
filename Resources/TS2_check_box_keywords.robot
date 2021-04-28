*** Settings ***
Library                 SeleniumLibrary
Library                 BuiltIn
Variables               ../PageObjects/Locators.py

*** Keywords ***
Verify that branches are not deployed
    ${oneelement}   get element count   ${unchecked_checkboxes}
    should be equal as integers     ${oneelement}   1

Deploy branches
    FOR   ${res}    IN RANGE  1  999
            ${count}  get element count   ${unchecked_branches}
            exit for loop if  '${res}' > '${count}'
            click element  (${unchecked_branches})[${res}]
    END

Verify thay branches are deployed
    ${multipleelements}  get element count   ${unchecked_checkboxes}
    should not be equal as integers  ${multipleelements}  1

Select random checkbox
    ${rand_XYZ}  generate random string  1  123456789
    Set Global Variable  ${rand_XYZ}
    click element   (${random_checkbox})[${rand_XYZ}]

Verify that checkbox is selected
    element attribute value should be   (${random_checkbox})[${rand_XYZ}]  class  rct-icon rct-icon-check