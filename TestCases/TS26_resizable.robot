*** Settings ***
Library                 BuiltIn
Library                 Collections
Library                 SeleniumLibrary
Resource                ../Bindings/keywords.robot
Resource                ../Resources/variables.robot
Resource                ../Resources/TS26_resizable_keywords.robot
Test Setup              Start browser and maximaze  https://demoqa.com/resizable
Test Teardown           close browser

*** Test Cases ***
Check whether user is abel to resize the box with limitations
    Get window size before resize       ${resizable_box_with_restriction}
    Drag and drop by offset             ${btn_resizable_box_with_restriction}     200   50
    Get window size after resize        ${resizable_box_with_restriction}
    Verify window size differences      ${element_after_width}      ${element_after_height}

Check whether user is able to resize the box with limitations to 151x151
    IF  '${element_before_width}' == '200px'
        drag and drop by offset         ${btn_resizable_box_with_restriction}     -49   -49
        Get window size after resize    ${resizable_box_with_restriction}
        Verify window is resized to     151px   151px
    END

Check whether user is able to resize the box with limitations to min size (150x150)
    IF  '${element_before_width}' == '200px'
        drag and drop by offset         ${btn_resizable_box_with_restriction}     -50   -50
        Get window size after resize    ${resizable_box_with_restriction}
        Verify window is resized to     150px   150px
    END

Check whether user is unable to resize the box with limitations to less than min size (150x150)
    IF  '${element_before_width}' == '200px'
        drag and drop by offset         ${btn_resizable_box_with_restriction}     -51   -51
        Get window size after resize    ${resizable_box_with_restriction}
        Verify window is resized to     150px   150px
    END

Check whether user is able to resize the box with limitations to 499x299
    IF  '${element_before_width}' == '200px'
        drag and drop by offset         ${btn_resizable_box_with_restriction}     299   99
        Get window size after resize    ${resizable_box_with_restriction}
        Verify window is resized to     499px   299px
    END

Check whether user is able to resize the box with limitations to max size (500x300)
    IF  '${element_before_width}' == '200px'
        drag and drop by offset         ${btn_resizable_box_with_restriction}     300   100
        Get window size after resize    ${resizable_box_with_restriction}
        Verify window is resized to     500px   300px
    END

Check whether user is unable to resize the box with limitations to more than max size (500x300)
    IF  '${element_before_width}' == '200px'
        drag and drop by offset         ${btn_resizable_box_with_restriction}     301   101
        Get window size after resize    ${resizable_box_with_restriction}
        Verify window is resized to     500px   300px
    END

Check whether user is abel to resize the box without limitations
    Get window size before resize       ${resizable_box_without_restriction}
    Drag and drop by offset             ${btn_resizable_box_without_restriction}     200   50
    Get window size after resize        ${resizable_box_without_restriction}
    Verify window size differences      ${element_after_width}      ${element_after_height}

Check whether user is able to resize the box without limitations to 21x21
    IF  '${element_before_width}' == '200px'
        drag and drop by offset         ${btn_resizable_box_without_restriction}     -179   -179
        Get window size after resize    ${resizable_box_without_restriction}
        Verify window is resized to     21px   21px
    END

Check whether user is able to resize the box without limitations to min size (20x20)
    IF  '${element_before_width}' == '200px'
        drag and drop by offset         ${btn_resizable_box_without_restriction}     -180   -180
        Get window size after resize    ${resizable_box_without_restriction}
        Verify window is resized to     20px   20px
    END

Check whether user is unable to resize the box without limitations to less than min size (20x20)
    IF  '${element_before_width}' == '200px'
        drag and drop by offset         ${btn_resizable_box_without_restriction}     -181   -181
        Get window size after resize    ${resizable_box_without_restriction}
        Verify window is resized to     20px   20px
    END

Check whether user is able to resize the box without limitations to 200×4320
    FOR     ${res}  IN RANGE        1  41
            Scroll down
            Drag and drop by offset     ${btn_resizable_box_without_restriction}     0   103
    END
    Get window size after resize        ${resizable_box_without_restriction}
    Verify window is resized to     200px   4320px

Check whether user is able to resize the box without limitations to 7680×200
    FOR     ${res}  IN RANGE        1  41
            Scroll down
            Drag and drop by offset     ${btn_resizable_box_without_restriction}     187   0
    END
    Get window size after resize        ${resizable_box_without_restriction}
    Verify window is resized to         7680px   200px

Check whether user is able to resize the box without limitations to 7680×4320
    FOR     ${res}  IN RANGE        1  41
            Scroll down
            Drag and drop by offset     ${btn_resizable_box_without_restriction}     187   103
    END
    Get window size after resize        ${resizable_box_without_restriction}
    Verify window is resized to         7680px   4320px