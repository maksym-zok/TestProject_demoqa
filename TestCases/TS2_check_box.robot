*** Settings ***
Library                 BuiltIn
Library                 Collections
Library                 RequestsLibrary
Library                 SeleniumLibrary
Resource        ../Bindings/keywords.robot
Resource        ../Resources/variables.robot
Test Setup              Start browser and maximaze  https://demoqa.com/checkbox
Test Teardown           close browser

*** Test Cases ***
Check whether checkboxes clickable
    FOR    ${i}    IN   1  2  3  4  5  6
           click element   xpath:(//span[@class="rct-text"]/*[@class="rct-collapse rct-collapse-btn"])[${i}]
           Exit For Loop If    ${i} == 6
    END
    click element   xpath://*[@id="tree-node"]/ol/li/ol/li[1]/span/label/span[1]/*[name()='svg']
    click element   xpath://*[@id="tree-node"]/ol/li/ol/li[2]/ol/li[1]/span/label/span[1]/*[name()='svg']
    click element   xpath://*[@id="tree-node"]/ol/li/ol/li[2]/ol/li[2]/span/label/span[1]/*[name()='svg']
    click element   xpath://*[@id="tree-node"]/ol/li/ol/li[3]/span/label/span[1]/*[name()='svg']
    FOR    ${res}    IN   You have selected :  home  desktop  notes  commands  documents  workspace  react  angular  veu  office  public  private  classified  general  downloads  wordFile  excelFile
           element should contain  id:result    ${res}
    END
