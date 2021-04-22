*** Settings ***
Library                 BuiltIn
Library                 Collections
Library                 SeleniumLibrary
Resource                ../Bindings/keywords.robot
Resource                ../Resources/variables.robot
Test Setup              Start browser and maximaze  https://demoqa.com/dragabble
Test Teardown           close browser

*** Test Cases ***
Check whether user is able to move element DRAG ME to all four corners of the page, in simple tab
    click element                       //a[text()='Simple']
    element attribute value should be   //a[text()='Simple']        aria-selected   true
    Send element to                     //div[text()='Drag me']     -400            -300
    Validate the element position       //div[text()='Drag me']     -400            -300
    reload page
    Send element to                     //div[text()='Drag me']     400             -300
    Validate the element position       //div[text()='Drag me']     400             -300
    reload page
    Send element to                     //div[text()='Drag me']     -400            300
    Validate the element position       //div[text()='Drag me']     -400            300
    reload page
    Send element to                     //div[text()='Drag me']     400             300
    Validate the element position       //div[text()='Drag me']     400             300

Check whether user is able to move element ONLY X along the x-axis , in Axis Restricted tab
    click element                       //a[text()='Axis Restricted']
    element attribute value should be   //a[text()='Axis Restricted']               aria-selected   true
    Send element to                     //div[text()='Only X']     -400             0
    Validate the element position       //div[text()='Only X']     -400             0
    reload page
    click element                       //a[text()='Axis Restricted']
    element attribute value should be   //a[text()='Axis Restricted']               aria-selected   true
    Send element to                     //div[text()='Only X']     400              0
    Validate the element position       //div[text()='Only X']     400              0

Check whether user is unable to move element ONLY X along the y-axis , in Axis Restricted tab
    click element                       //a[text()='Axis Restricted']
    element attribute value should be   //a[text()='Axis Restricted']               aria-selected   true
    Send element to                     //div[text()='Only X']     0                -100
    Validate the element position       //div[text()='Only X']     0                0
    reload page
    click element                       //a[text()='Axis Restricted']
    element attribute value should be   //a[text()='Axis Restricted']               aria-selected   true
    Send element to                     //div[text()='Only X']     0                100
    Validate the element position       //div[text()='Only X']     0                0

Check whether user is able to move element ONLY Y along the y-axis , in Axis Restricted tab
    click element                       //a[text()='Axis Restricted']
    element attribute value should be   //a[text()='Axis Restricted']               aria-selected   true
    Send element to                     //div[text()='Only Y']     0                300
    Validate the element position       //div[text()='Only Y']     0                300
    reload page
    click element                       //a[text()='Axis Restricted']
    element attribute value should be   //a[text()='Axis Restricted']               aria-selected   true
    Send element to                     //div[text()='Only Y']     0                -300
    Validate the element position       //div[text()='Only Y']     0                -300

Check whether user is unable to move element ONLY Y along the x-axis , in Axis Restricted tab
    click element                       //a[text()='Axis Restricted']
    element attribute value should be   //a[text()='Axis Restricted']               aria-selected   true
    Send element to                     //div[text()='Only Y']     -100             0
    Validate the element position       //div[text()='Only Y']     0                0
    reload page
    click element                       //a[text()='Axis Restricted']
    element attribute value should be   //a[text()='Axis Restricted']               aria-selected   true
    Send element to                     //div[text()='Only Y']     100              0
    Validate the element position       //div[text()='Only Y']     0                0

Check whether user is able to move element contained within the box inside that box, in Container Restricted tab
    click element                       //a[text()='Container Restricted']
    element attribute value should be   //a[text()='Container Restricted']          aria-selected   true
    Send element to                     //div[text()="I'm contained within the box"]     60         60
    Send element to                     //div[text()="I'm contained within the box"]     -60        -60
    Validate the element position       //div[text()="I'm contained within the box"]     0          0

Check whether user is able to move element contained whithin the box to the edge of the box, in Container Restricted tab
    click element                       //a[text()='Container Restricted']
    element attribute value should be   //a[text()='Container Restricted']          aria-selected   true
    Send element to                     //div[text()="I'm contained within the box"]     0         106
    Validate the element position       //div[text()="I'm contained within the box"]     0         106

Check whether user is unable to move element contained whithin the box out of the box, in Container Restricred tab
    click element                       //a[text()='Container Restricted']
    element attribute value should be   //a[text()='Container Restricted']          aria-selected   true
    Send element to                     //div[text()="I'm contained within the box"]     1200       0
    Validation of an element with invalid expected result       //div[text()="I'm contained within the box"]     1200         1
    reload page
    click element                       //a[text()='Container Restricted']
    Send element to                     //div[text()="I'm contained within the box"]     -400       5
    Validation of an element with invalid expected result       //div[text()="I'm contained within the box"]     -400         2
    click element                       //a[text()='Container Restricted']
    Send element to                     //div[text()="I'm contained within the box"]     1       400
    Validation of an element with invalid expected result       //div[text()="I'm contained within the box"]      0        400
    click element                       //a[text()='Container Restricted']
    Send element to                     //div[text()="I'm contained within the box"]     -1       -400
    Validation of an element with invalid expected result       //div[text()="I'm contained within the box"]      -1        -400

Check whether user is able to move element contained within parent inside that box, in Container Restricted tab
    click element                       //a[text()='Container Restricted']
    element attribute value should be   //a[text()='Container Restricted']          aria-selected   true
    Send element to                     //span[text()="I'm contained within my parent"]     60         60
    Send element to                     //span[text()="I'm contained within my parent"]     -60        -60
    Validate the element position       //span[text()="I'm contained within my parent"]     0          0

Check whether user is able to move element contained whithin parent to the edge of the box, in Container Restricted tab
    click element                       //a[text()='Container Restricted']
    element attribute value should be   //a[text()='Container Restricted']          aria-selected   true
    Send element to                     //span[text()="I'm contained within my parent"]     0         86
    Validate the element position       //span[text()="I'm contained within my parent"]     0         86

Check whether user is unable to move element contained whithin parent out of the box, in Container Restricred tab
    click element                       //a[text()='Container Restricted']
    element attribute value should be   //a[text()='Container Restricted']          aria-selected   true
    Send element to                     //span[text()="I'm contained within my parent"]     200       0
    Validation of an element with invalid expected result       //span[text()="I'm contained within my parent"]     200         1
    reload page
    click element                       //a[text()='Container Restricted']
    Send element to                     //span[text()="I'm contained within my parent"]     -200       5
    Validation of an element with invalid expected result       //span[text()="I'm contained within my parent"]     -400         2
    click element                       //a[text()='Container Restricted']
    Send element to                     //span[text()="I'm contained within my parent"]     1       200
    Validation of an element with invalid expected result       //span[text()="I'm contained within my parent"]      0        200
    click element                       //a[text()='Container Restricted']
    Send element to                     //span[text()="I'm contained within my parent"]     -1       -200
    Validation of an element with invalid expected result       //span[text()="I'm contained within my parent"]      -1        -200

Check whether cursor sticks to the center of the element when user drag and drop it, in Cursor Style tab
    click element                       //a[text()='Cursor Style']
    element attribute value should be   //a[text()='Cursor Style']          aria-selected   true
    capture page screenshot             C:/Users/maksy/PycharmProjects/TestProject_1/Screenshots/scree.png
#    drag and drop by offset             id:cursorBottom                     -100     -225
    drag and drop                       id:cursorBottom            (//*[@stroke="currentColor"])[34]
#    dra
    capture page screenshot             C:/Users/maksy/PycharmProjects/TestProject_1/Screenshots/scree2.png

