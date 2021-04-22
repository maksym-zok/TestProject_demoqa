*** Settings ***
Library                 BuiltIn
Library                 Collections
Library                 SeleniumLibrary
Resource                ../Bindings/keywords.robot
Resource                ../Resources/variables.robot
Test Setup              Start browser and maximaze  https://demoqa.com/droppable
Test Teardown           close browser

*** Test Cases ***
Check whether user is able to drop element DRAG ME to DROP HERE element in SIMPLE tab
    click element                       //a[text()='Simple']
    element attribute value should be   //a[text()='Simple']            aria-selected                                                   true
    ${element_before_background}        Get CSS Property Value          //div[@id="simpleDropContainer"]/div[@id="droppable"]           background-color
    should be equal as strings          ${element_before_background}    rgba(0, 0, 0, 0)
    ${element_before_text}              element text should be          //div[@id="simpleDropContainer"]/div[@id="droppable"]/p         Drop here
    drag and drop                       //div[@id="draggable"]          //div[@id="simpleDropContainer"]/div[@id="droppable"]
    wait until element contains         //div[@id="simpleDropContainer"]/div[@id="droppable"]/p                                         Dropped!
    ${element_after_background}         Get CSS Property Value          //div[@class="drop-box ui-droppable ui-state-highlight"]        background-color
    should be equal as strings          ${element_after_background}     rgba(70, 130, 180, 1)

Check whether user is able to take out the element DRAG ME from DROPPED element in SIMPLE tab
    click element                       //a[text()='Simple']
    element attribute value should be   //a[text()='Simple']            aria-selected                                                   true
    ${element_before_background}        Get CSS Property Value          //div[@id="simpleDropContainer"]/div[@id="droppable"]           background-color
    should be equal as strings          ${element_before_background}    rgba(0, 0, 0, 0)
    ${element_before_text}              element text should be          //div[@id="simpleDropContainer"]/div[@id="droppable"]/p         Drop here
    drag and drop                       //div[@id="draggable"]          //div[@id="simpleDropContainer"]/div[@id="droppable"]
    wait until element contains         //div[@id="simpleDropContainer"]/div[@id="droppable"]/p                                         Dropped!
    ${element_after_background}         Get CSS Property Value          //div[@id="simpleDropContainer"]/div[@id="droppable"]           background-color
    should be equal as strings          ${element_after_background}     rgba(70, 130, 180, 1)
    drag and drop by offset             //div[@id="draggable"]          -200     0
    ${position_after}                   Get CSS Property Value          //div[@id="draggable"]                                          left
    should be equal as strings          ${position_after}               153px

Check whether DROPPED element doesnt change its condition when user takes out DRAG ME element off DROPPED, in Simple tab
    click element                       //a[text()='Simple']
    element attribute value should be   //a[text()='Simple']            aria-selected                                                   true
    ${element_before_background}        Get CSS Property Value          //div[@id="simpleDropContainer"]/div[@id="droppable"]           background-color
    should be equal as strings          ${element_before_background}    rgba(0, 0, 0, 0)
    ${element_before_text}              element text should be          //div[@id="simpleDropContainer"]/div[@id="droppable"]/p         Drop here
    drag and drop                       //div[@id="draggable"]          //div[@id="simpleDropContainer"]/div[@id="droppable"]
    wait until element contains         //div[@id="simpleDropContainer"]/div[@id="droppable"]/p                                         Dropped!
    ${element_after_background}         Get CSS Property Value          //div[@id="simpleDropContainer"]/div[@id="droppable"]           background-color
    should be equal as strings          ${element_after_background}     rgba(70, 130, 180, 1)
    drag and drop by offset             //div[@id="draggable"]          -200     0
    ${position_after}                   Get CSS Property Value          //div[@id="draggable"]                                          left
    should be equal as strings          ${position_after}               153px
    ${element_after_background_2}       Get CSS Property Value          //div[@id="simpleDropContainer"]/div[@id="droppable"]           background-color
    should be equal as strings          ${element_after_background}     rgba(70, 130, 180, 1)
    element text should be              //div[@id="simpleDropContainer"]/div[@id="droppable"]/p                                         Dropped!

Check whether DROP HERE element doesnt change its condition when user inserts NOT ACCEPTABLE element in DROP HERE, in ACCEPT tab
    click element                       //a[text()='Accept']
    element attribute value should be   //a[text()='Accept']            aria-selected                                                       true
    ${element_before_background}        Get CSS Property Value          //div[@class="accept-drop-container"]/div[@id="droppable"]          background-color
    should be equal as strings          ${element_before_background}    rgba(0, 0, 0, 0)
    ${element_before_text}              element text should be          //div[@class="accept-drop-container"]/div[@id="droppable"]/p        Drop here
    drag and drop                       //div[@id="notAcceptable"]      //div[@class="accept-drop-container"]/div[@id="droppable"]
    ${element_after_background}         Get CSS Property Value          //div[@class="accept-drop-container"]/div[@id="droppable"]          background-color
    should be equal as strings          ${element_after_background}     rgba(0, 0, 0, 0)

Check whether DROP HERE element changes its condition when user inserts ACCEPTABLE element in DROP HERE, in ACCEPT tab
    click element                       //a[text()='Accept']
    element attribute value should be   //a[text()='Accept']            aria-selected   true
    ${element_before_background}        Get CSS Property Value          //div[@class="accept-drop-container"]/div[@id="droppable"]          background-color
    should be equal as strings          ${element_before_background}    rgba(0, 0, 0, 0)
    ${element_before_text}              element text should be          //div[@class="accept-drop-container"]/div[@id="droppable"]          Drop here
    drag and drop                       //div[@id="acceptable"]         //div[@class="accept-drop-container"]/div[@id="droppable"]
    ${element_after_background}         Get CSS Property Value          //div[@class="accept-drop-container"]/div[@id="droppable"]          background-color
    should be equal as strings          ${element_after_background}     rgba(70, 130, 180, 1)

Check whether DROPPED element doesnt change its condition when user takes out ACCEPTABLE element off DROPPED, in ACCEPT tab
    click element                       //a[text()='Accept']
    element attribute value should be   //a[text()='Accept']            aria-selected                                                       true
    ${element_before_background}        Get CSS Property Value          //div[@class="accept-drop-container"]/div[@id="droppable"]          background-color
    should be equal as strings          ${element_before_background}    rgba(0, 0, 0, 0)
    ${element_before_text}              element text should be          //div[@class="accept-drop-container"]/div[@id="droppable"]          Drop here
    drag and drop                       //div[@id="acceptable"]         //div[@class="accept-drop-container"]/div[@id="droppable"]
    ${element_after_background}         Get CSS Property Value          //div[@class="accept-drop-container"]/div[@id="droppable"]          background-color
    should be equal as strings          ${element_after_background}     rgba(70, 130, 180, 1)
    drag and drop by offset             //div[@id="acceptable"]          -200     0
    ${position_after}                   Get CSS Property Value          //div[@id="acceptable"]                                             left
    should be equal as strings          ${position_after}               153px
    ${element_after_background_2}       Get CSS Property Value          //div[@id="simpleDropContainer"]/div[@id="droppable"]               background-color
    should be equal as strings          ${element_after_background}     rgba(70, 130, 180, 1)
    element text should be              //div[@class="accept-drop-container"]/div[@id="droppable"]                                          Dropped!

Check whether OUTER DROPABLE not greedy element changes its condition when user inserts DRAG ME element in OUTER DROPABLE, in PREVENT PROPOGATION tab
    click element                       //a[text()='Prevent Propogation']
    element attribute value should be   //a[text()='Prevent Propogation']                                       aria-selected               true
    ${element_before_background}        Get CSS Property Value          //div[@id="notGreedyDropBox"]           background-color
    should be equal as strings          ${element_before_background}    rgba(0, 0, 0, 0)
    drag and drop                       //div[@id="dragBox"]            //div[@id="notGreedyDropBox"]/p
    ${element_after_background}         Get CSS Property Value          //div[@id="notGreedyDropBox"]           background-color
    should be equal as strings          ${element_after_background}     rgba(70, 130, 180, 1)
    ${element_inner_background}         Get CSS Property Value          //div[@id="notGreedyInnerDropBox"]      background-color
    should be equal as strings          ${element_inner_background}     rgba(0, 0, 0, 0)

Check whether OUTER DROPABLE not greedy and INNER DROPABLE not greedy elements change their condition when user inserts DRAG ME element in INNER DROPABLE, in PREVENT PROPOGATION tab
    click element                       //a[text()='Prevent Propogation']
    element attribute value should be   //a[text()='Prevent Propogation']                                       aria-selected               true
    ${element_before_outer}             Get CSS Property Value          //div[@id="notGreedyDropBox"]                                       background-color
    ${element_before_inner}             Get CSS Property Value          //div[@id="notGreedyInnerDropBox"]      background-color
    should be equal as strings          ${element_before_outer}         rgba(0, 0, 0, 0)
    should be equal as strings          ${element_before_inner}         rgba(0, 0, 0, 0)
    drag and drop                       //div[@id="dragBox"]            //div[@id="notGreedyInnerDropBox"]/p
    ${element_after_outer}              Get CSS Property Value          //div[@id="notGreedyDropBox"]           background-color
    ${element_after_inner}              Get CSS Property Value          //div[@id="notGreedyInnerDropBox"]      background-color
    should be equal as strings          ${element_after_outer}          rgba(70, 130, 180, 1)
    should be equal as strings          ${element_after_inner}          rgba(70, 130, 180, 1)

Check whether INNER DROPABLE greedy element changes its condition when user inserts DRAG ME element in OUTER DROPABLE, in PREVENT PROPOGATION tab
    click element                       //a[text()='Prevent Propogation']
    element attribute value should be   //a[text()='Prevent Propogation']                                       aria-selected               true
    ${element_before_background}        Get CSS Property Value          //div[@id="greedyDropBoxInner"]         background-color
    should be equal as strings          ${element_before_background}    rgba(0, 0, 0, 0)
    drag and drop                       //div[@id="dragBox"]            //div[@id="greedyDropBoxInner"]/p
    ${element_after_background}         Get CSS Property Value          //div[@id="greedyDropBoxInner"]         background-color
    should be equal as strings          ${element_after_background}     rgba(70, 130, 180, 1)
    ${element_inner_background}         Get CSS Property Value          //div[@id="greedyDropBox"]              background-color
    should be equal as strings          ${element_inner_background}     rgba(0, 0, 0, 0)

Check whether OUTER DROPABLE greedy element changes its condition when user inserts DRAG ME element in OUTER DROPABLE, in PREVENT PROPOGATION tab
    click element                       //a[text()='Prevent Propogation']
    element attribute value should be   //a[text()='Prevent Propogation']                                       aria-selected               true
    ${element_before_background}        Get CSS Property Value          //div[@id="greedyDropBox"]              background-color
    should be equal as strings          ${element_before_background}    rgba(0, 0, 0, 0)
    drag and drop                       //div[@id="dragBox"]            //div[@id="greedyDropBox"]/p
    ${element_after_background}         Get CSS Property Value          //div[@id="greedyDropBox"]              background-color
    should be equal as strings          ${element_after_background}     rgba(70, 130, 180, 1)
    ${element_inner_background}         Get CSS Property Value          //div[@id="greedyDropBoxInner"]         background-color
    should be equal as strings          ${element_inner_background}     rgba(0, 0, 0, 0)

Check whether DROP HERE element changes its condition when user inserts NOT REVERT element in DROP HERE, in REVERT DRAGABLE tab
    click element                       //a[text()='Revert Draggable']
    element attribute value should be   //a[text()='Revert Draggable']                                          aria-selected               true
    ${element_before_background}        Get CSS Property Value          //div[@class="revertable-drop-container"]/div[@id="droppable"]      background-color
    should be equal as strings          ${element_before_background}    rgba(0, 0, 0, 0)
    drag and drop                       //div[@id="notRevertable"]      //div[@class="revertable-drop-container"]/div[@id="droppable"]
    ${element_after_background}         Get CSS Property Value          //div[@class="revertable-drop-container"]/div[@id="droppable"]      background-color
    element text should be              //div[@class="revertable-drop-container"]/div[@id="droppable"]/p         Dropped!
    should be equal as strings          ${element_after_background}     rgba(70, 130, 180, 1)

Check whether DROP HERE element changes its condition when user inserts WILL REVERT element in DROP HERE, in REVERT DRAGABLE tab
    click element                       //a[text()='Revert Draggable']
    element attribute value should be   //a[text()='Revert Draggable']                                          aria-selected               true
    ${element_before_background}        Get CSS Property Value          //div[@class="revertable-drop-container"]/div[@id="droppable"]      background-color
    should be equal as strings          ${element_before_background}    rgba(0, 0, 0, 0)
    drag and drop                       //div[@id="revertable"]         //div[@class="revertable-drop-container"]/div[@id="droppable"]
    ${element_after_background}         Get CSS Property Value          //div[@class="revertable-drop-container"]/div[@id="droppable"]       background-color
    element text should be              //div[@class="revertable-drop-container"]/div[@id="droppable"]/p         Dropped!
    should be equal as strings          ${element_after_background}     rgba(70, 130, 180, 1)

Check whether WILL REVERT element comes out of the DROP HERE element, in REVER DRAGABLE tab
    click element                       //a[text()='Revert Draggable']
    element attribute value should be   //a[text()='Revert Draggable']                                          aria-selected               true
    ${element_before_position}          Get CSS Property Value          //div[@id="revertable"]                 left
    should be equal as strings          ${element_before_position}      0px
    ${element_before_background}        Get CSS Property Value          //div[@class="revertable-drop-container"]/div[@id="droppable"]      background-color
    should be equal as strings          ${element_before_background}    rgba(0, 0, 0, 0)
    drag and drop                       //div[@id="revertable"]         //div[@class="revertable-drop-container"]/div[@id="droppable"]
    ${element_after_background}         Get CSS Property Value          //div[@class="revertable-drop-container"]/div[@id="droppable"]      background-color
    element text should be              //div[@class="revertable-drop-container"]/div[@id="droppable"]/p                                    Dropped!
    sleep                               1
    should be equal as strings          ${element_after_background}     rgba(70, 130, 180, 1)
    ${element_before_position}          Get CSS Property Value          //div[@id="revertable"]                 left
    should be equal as strings          ${element_before_position}      0px

Check whether NOT REVERT element doesnt come out of the DROP HERE element, in REVER DRAGABLE tab
    click element                       //a[text()='Revert Draggable']
    element attribute value should be   //a[text()='Revert Draggable']                                          aria-selected               true
    ${element_before_position}          Get CSS Property Value          //div[@id="notRevertable"]              left
    should be equal as strings          ${element_before_position}      0px
    ${element_before_background}        Get CSS Property Value          //div[@class="revertable-drop-container"]/div[@id="droppable"]      background-color
    should be equal as strings          ${element_before_background}    rgba(0, 0, 0, 0)
    drag and drop                       //div[@id="notRevertable"]      //div[@class="revertable-drop-container"]/div[@id="droppable"]
    ${element_after_background}         Get CSS Property Value          //div[@class="revertable-drop-container"]/div[@id="droppable"]      background-color
    element text should be              //div[@class="revertable-drop-container"]/div[@id="droppable"]/p        Dropped!
    should be equal as strings          ${element_after_background}     rgba(70, 130, 180, 1)
    ${element_before_position}          Get CSS Property Value          //div[@id="notRevertable"]              left
    should be equal as strings          ${element_before_position}      353px