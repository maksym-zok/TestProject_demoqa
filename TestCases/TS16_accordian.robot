*** Settings ***
Library                 BuiltIn
Library                 Collections
Library                 SeleniumLibrary
Resource                ../Bindings/keywords.robot
Resource                ../Resources/variables.robot
Test Setup              Start browser and maximaze  https://demoqa.com/accordian
Test Teardown           close browser

*** Test Cases ***
Сheck whether the accordions can be opened
    Open accordion  (//div[@id="section1Content"]/..)[last()]   //div[@id="section1Heading"]
    Open accordion  (//div[@id="section2Content"]/..)[last()]   //div[@id="section2Heading"]
    Open accordion  (//div[@id="section3Content"]/..)[last()]   //div[@id="section3Heading"]

Check whether only one accordion can be opened
    ${xpath_collapse_check1}    set variable    (//div[@id="section1Content"]/..)[last()]
    ${xpath_collapse_check2}    set variable    (//div[@id="section2Content"]/..)[last()]
    ${xpath_collapse_check3}    set variable    (//div[@id="section3Content"]/..)[last()]
    Open accordion and check that other are closed  ${xpath_collapse_check1}    //div[@id="section1Content"]/../../div[@class="collapse show"]   //div[@id="section1Heading"]    ${xpath_collapse_check2}   ${xpath_collapse_check3}
    Open accordion and check that other are closed  ${xpath_collapse_check2}    //div[@id="section2Content"]/../../div[@class="collapse show"]   //div[@id="section2Heading"]    ${xpath_collapse_check1}   ${xpath_collapse_check3}
    Open accordion and check that other are closed  ${xpath_collapse_check3}    //div[@id="section3Content"]/../../div[@class="collapse show"]   //div[@id="section3Heading"]    ${xpath_collapse_check1}   ${xpath_collapse_check2}