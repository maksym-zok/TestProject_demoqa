*** Settings ***
Library                 BuiltIn
Library                 Collections
Library                 SeleniumLibrary
Resource                ../Bindings/keywords.robot
Resource                ../Resources/variables.robot
Test Setup              Start browser and maximaze  https://demoqa.com/resizable
Test Teardown           close browser

*** Test Cases ***
Check whether user is abel to resize the box with limitations
    ${element_before_width}             Get CSS Property Value      //div[@id="resizableBoxWithRestriction"]     width
    ${element_before_height}            Get CSS Property Value      //div[@id="resizableBoxWithRestriction"]     height
    drag and drop by offset             //div[@id="resizableBoxWithRestriction"]/span     200   50
    ${element_after_width}              Get CSS Property Value      //div[@id="resizableBoxWithRestriction"]     width
    ${element_after_height}             Get CSS Property Value      //div[@id="resizableBoxWithRestriction"]     height
    should not be equal as strings      ${element_before_width}     ${element_after_width}
    should not be equal as strings      ${element_before_height}    ${element_after_height}

Check whether user is able to resize the box with limitations to 151x151
    ${element_before_width}             Get CSS Property Value      //div[@id="resizableBoxWithRestriction"]     width
    ${element_before_height}            Get CSS Property Value      //div[@id="resizableBoxWithRestriction"]     height
    should be equal as strings          ${element_before_width}     ${element_before_height}
    IF  '${element_before_width}' == '200px'
        drag and drop by offset         //div[@id="resizableBoxWithRestriction"]/span     -49   -49
        ${element_after_width}          Get CSS Property Value      //div[@id="resizableBoxWithRestriction"]     width
        ${element_after_height}         Get CSS Property Value      //div[@id="resizableBoxWithRestriction"]     height
        should be equal as strings      ${element_after_width}      151px
        should be equal as strings      ${element_after_height}     151px
    END

Check whether user is able to resize the box with limitations to min size (150x150)
    ${element_before_width}             Get CSS Property Value      //div[@id="resizableBoxWithRestriction"]     width
    ${element_before_height}            Get CSS Property Value      //div[@id="resizableBoxWithRestriction"]     height
    should be equal as strings          ${element_before_width}     ${element_before_height}
    IF  '${element_before_width}' == '200px'
        drag and drop by offset         //div[@id="resizableBoxWithRestriction"]/span     -50   -50
        ${element_after_width}          Get CSS Property Value      //div[@id="resizableBoxWithRestriction"]     width
        ${element_after_height}         Get CSS Property Value      //div[@id="resizableBoxWithRestriction"]     height
        should be equal as strings      ${element_after_width}      150px
        should be equal as strings      ${element_after_height}     150px
    END

Check whether user is unable to resize the box with limitations to less than min size (150x150)
    ${element_before_width}             Get CSS Property Value      //div[@id="resizableBoxWithRestriction"]     width
    ${element_before_height}            Get CSS Property Value      //div[@id="resizableBoxWithRestriction"]     height
    should be equal as strings          ${element_before_width}     ${element_before_height}
    IF  '${element_before_width}' == '200px'
        drag and drop by offset         //div[@id="resizableBoxWithRestriction"]/span     -51   -51
        ${element_after_width}          Get CSS Property Value      //div[@id="resizableBoxWithRestriction"]     width
        ${element_after_height}         Get CSS Property Value      //div[@id="resizableBoxWithRestriction"]     height
        should be equal as strings      ${element_after_width}      150px
        should be equal as strings      ${element_after_height}     150px
    END

Check whether user is able to resize the box with limitations to 499x299
    ${element_before_width}             Get CSS Property Value      //div[@id="resizableBoxWithRestriction"]     width
    ${element_before_height}            Get CSS Property Value      //div[@id="resizableBoxWithRestriction"]     height
    should be equal as strings          ${element_before_width}     ${element_before_height}
    IF  '${element_before_width}' == '200px'
        drag and drop by offset         //div[@id="resizableBoxWithRestriction"]/span     299   99
        ${element_after_width}          Get CSS Property Value      //div[@id="resizableBoxWithRestriction"]     width
        ${element_after_height}         Get CSS Property Value      //div[@id="resizableBoxWithRestriction"]     height
        should be equal as strings      ${element_after_width}      499px
        should be equal as strings      ${element_after_height}     299px
    END

Check whether user is able to resize the box with limitations to max size (500x300)
    ${element_before_width}             Get CSS Property Value      //div[@id="resizableBoxWithRestriction"]     width
    ${element_before_height}            Get CSS Property Value      //div[@id="resizableBoxWithRestriction"]     height
    should be equal as strings          ${element_before_width}     ${element_before_height}
    IF  '${element_before_width}' == '200px'
        drag and drop by offset         //div[@id="resizableBoxWithRestriction"]/span     300   100
        ${element_after_width}          Get CSS Property Value      //div[@id="resizableBoxWithRestriction"]     width
        ${element_after_height}         Get CSS Property Value      //div[@id="resizableBoxWithRestriction"]     height
        should be equal as strings      ${element_after_width}      500px
        should be equal as strings      ${element_after_height}     300px
    END

Check whether user is unable to resize the box with limitations to more than max size (500x300)
    ${element_before_width}             Get CSS Property Value      //div[@id="resizableBoxWithRestriction"]     width
    ${element_before_height}            Get CSS Property Value      //div[@id="resizableBoxWithRestriction"]     height
    should be equal as strings          ${element_before_width}     ${element_before_height}
    IF  '${element_before_width}' == '200px'
        drag and drop by offset         //div[@id="resizableBoxWithRestriction"]/span     301   101
        ${element_after_width}          Get CSS Property Value      //div[@id="resizableBoxWithRestriction"]     width
        ${element_after_height}         Get CSS Property Value      //div[@id="resizableBoxWithRestriction"]     height
        should be equal as strings      ${element_after_width}      500px
        should be equal as strings      ${element_after_height}     300px
    END

Check whether user is abel to resize the box without limitations
    ${element_before_width}             Get CSS Property Value      //div[@id="resizable"]                       width
    ${element_before_height}            Get CSS Property Value      //div[@id="resizable"]                       height
    drag and drop by offset             //div[@id="resizable"]/span     200   50
    ${element_after_width}              Get CSS Property Value      //div[@id="resizable"]                       width
    ${element_after_height}             Get CSS Property Value      //div[@id="resizable"]                       height
    should not be equal as strings      ${element_before_width}     ${element_after_width}
    should not be equal as strings      ${element_before_height}    ${element_after_height}

Check whether user is able to resize the box without limitations to 21x21
    ${element_before_width}             Get CSS Property Value      //div[@id="resizable"]                       width
    ${element_before_height}            Get CSS Property Value      //div[@id="resizable"]                       height
    should be equal as strings          ${element_before_width}     ${element_before_height}
    IF  '${element_before_width}' == '200px'
        drag and drop by offset         //div[@id="resizable"]/span     -179   -179
        ${element_after_width}          Get CSS Property Value      //div[@id="resizable"]                       width
        ${element_after_height}         Get CSS Property Value      //div[@id="resizable"]                       height
        should be equal as strings      ${element_after_width}      21px
        should be equal as strings      ${element_after_height}     21px
    END

Check whether user is able to resize the box without limitations to min size (20x20)
    ${element_before_width}             Get CSS Property Value      //div[@id="resizable"]                       width
    ${element_before_height}            Get CSS Property Value      //div[@id="resizable"]                       height
    should be equal as strings          ${element_before_width}     ${element_before_height}
    IF  '${element_before_width}' == '200px'
        drag and drop by offset         //div[@id="resizable"]/span     -180   -180
        ${element_after_width}          Get CSS Property Value      //div[@id="resizable"]                       width
        ${element_after_height}         Get CSS Property Value      //div[@id="resizable"]                       height
        should be equal as strings      ${element_after_width}      20px
        should be equal as strings      ${element_after_height}     20px
    END

Check whether user is unable to resize the box without limitations to less than min size (20x20)
    ${element_before_width}             Get CSS Property Value      //div[@id="resizable"]                       width
    ${element_before_height}            Get CSS Property Value      //div[@id="resizable"]                       height
    should be equal as strings          ${element_before_width}     ${element_before_height}
    IF  '${element_before_width}' == '200px'
        drag and drop by offset         //div[@id="resizable"]/span     -181   -181
        ${element_after_width}          Get CSS Property Value      //div[@id="resizable"]                       width
        ${element_after_height}         Get CSS Property Value      //div[@id="resizable"]                       height
        should be equal as strings      ${element_after_width}      20px
        should be equal as strings      ${element_after_height}     20px
    END

Check whether user is able to resize the box without limitations to 500×4320
    ${element_before_width}             Get CSS Property Value      //div[@id="resizable"]                       width
    ${element_before_height}            Get CSS Property Value      //div[@id="resizable"]                       height
    should be equal as strings          ${element_before_width}     ${element_before_height}
    drag and drop by offset             //div[@id="resizable"]/span     300   0
    FOR     ${res}  IN RANGE        1  129
            execute javascript          window.scrollTo(0,document.body.scrollHeight)
            drag and drop by offset     //div[@id="resizable"]/span     0   135
    END
Check whether user is able to resize the box without limitations to 7680×350
    ${element_before_width}             Get CSS Property Value      //div[@id="resizable"]                       width
    ${element_before_height}            Get CSS Property Value      //div[@id="resizable"]                       height
    should be equal as strings          ${element_before_width}     ${element_before_height}
    drag and drop by offset             //div[@id="resizable"]/span     0   150
    FOR     ${res}  IN RANGE        1  129
            execute javascript          window.scrollTo(0,document.body.scrollHeight)
            drag and drop by offset     //div[@id="resizable"]/span    240  0
    END

Check whether user is able to resize the box without limitations to 7680×4320
    ${element_before_width}             Get CSS Property Value    //div[@id="resizable"]                         width
    ${element_before_height}            Get CSS Property Value    //div[@id="resizable"]                         height
    should be equal as strings          ${element_before_width}     ${element_before_height}
    FOR     ${res}  IN RANGE        1  129
            execute javascript          window.scrollTo(0,document.body.scrollHeight)
            drag and drop by offset     //div[@id="resizable"]/span     240   135
    END