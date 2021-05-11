*** Settings ***
Library                 BuiltIn
Library                 Collections
Library                 SeleniumLibrary
Resource                ../Bindings/keywords.robot
Resource                ../Resources/variables.robot
Resource                ../Resources/TS27_droppable_keywords.robot
Test Setup              Start browser and maximaze  https://demoqa.com/droppable
Test Teardown           close browser

*** Test Cases ***
Check whether user is able to drop element DRAG ME to DROP HERE element in SIMPLE tab
    Open tab                            ${btn_tab_simple}
    Get background color before drop    ${box_tab_simple}
    Verify text before drop             ${box_text_tab_simple}          ${drop_here}
    Drag and drop                       ${draggable_el_tab_simple}      ${box_tab_simple}
    Verify text after drop              ${box_text_tab_simple}          ${dropped}
    Get background color after drop     ${box_tab_simple}
    Verify color changing               ${element_before_background}    ${element_after_background}

Check whether user is able to take out the element DRAG ME from DROPPED element in SIMPLE tab
    Open tab                            ${btn_tab_simple}
    Get background color before drop    ${box_tab_simple}
    Verify text before drop             ${box_text_tab_simple}          ${drop_here}
    Drag and drop                       ${draggable_el_tab_simple}      ${box_tab_simple}
    Verify text after drop              ${box_text_tab_simple}          ${dropped}
    Get background color after drop     ${box_tab_simple}
    Verify color changing               ${element_before_background}    ${element_after_background}
    drag and drop by offset             ${draggable_el_tab_simple}      -200     0
    Verify element position             ${draggable_el_tab_simple}      153px

Check whether DROPPED element doesnt change its condition when user takes out DRAG ME element off DROPPED, in Simple tab
    Open tab                            ${btn_tab_simple}
    Get background color before drop    ${box_tab_simple}
    Verify text before drop             ${box_text_tab_simple}          ${drop_here}
    Drag and drop                       ${draggable_el_tab_simple}      ${box_tab_simple}
    Verify text after drop              ${box_text_tab_simple}          ${dropped}
    Get background color after drop     ${box_tab_simple}
    Verify color changing               ${element_before_background}    ${element_after_background}
    Get background color before drop    ${box_tab_simple}
    drag and drop by offset             ${draggable_el_tab_simple}      -200     0
    Verify element position             ${draggable_el_tab_simple}      153px
    Get background color after drop     ${box_tab_simple}
    Verify color is not changing        ${element_before_background}    ${element_after_background}

Check whether DROP HERE element doesnt change its condition when user inserts NOT ACCEPTABLE element in DROP HERE, in ACCEPT tab
    Open tab                            ${btn_tab_accept}
    Get background color before drop    ${box_tab_accept}
    Verify text before drop             ${box_text_tab_accept}              ${drop_here}
    Drag and drop                       ${not_acceptable_el_tab_accept}     ${box_tab_accept}
    Verify text after drop              ${box_text_tab_accept}              ${drop_here}
    Get background color after drop     ${box_tab_accept}
    Verify color is not changing        ${element_before_background}        ${element_after_background}

Check whether DROP HERE element changes its condition when user inserts ACCEPTABLE element in DROP HERE, in ACCEPT tab
    Open tab                            ${btn_tab_accept}
    Get background color before drop    ${box_tab_accept}
    Verify text before drop             ${box_text_tab_accept}          ${drop_here}
    Drag and drop                       ${acceptable_el_tab_accept}     ${box_tab_accept}
    Verify text after drop              ${box_text_tab_accept}          ${dropped}
    Get background color after drop     ${box_tab_accept}
    Verify color changing               ${element_before_background}    ${element_after_background}

Check whether DROPPED element doesnt change its condition when user takes out ACCEPTABLE element off DROPPED, in ACCEPT tab
    Open tab                            ${btn_tab_accept}
    Get background color before drop    ${box_tab_accept}
    Verify text before drop             ${box_text_tab_accept}          ${drop_here}
    Drag and drop                       ${acceptable_el_tab_accept}     ${box_tab_accept}
    Verify text after drop              ${box_text_tab_accept}          ${dropped}
    Get background color after drop     ${box_tab_accept}
    Verify color changing               ${element_before_background}    ${element_after_background}
    Get background color before drop    ${box_tab_accept}
    drag and drop by offset             ${acceptable_el_tab_accept}      -200     0
    Verify element position             ${acceptable_el_tab_accept}     153px
    Get background color after drop     ${box_tab_accept}
    Verify color is not changing        ${element_before_background}    ${element_after_background}

Check whether OUTER DROPABLE not greedy element changes its condition when user inserts DRAG ME element in OUTER DROPABLE, in PREVENT PROPOGATION tab
    Open tab                            ${btn_tab_prevent}
    Get background color before drop    ${box_not_gr_dropbox_tab_prevent}
    Verify text before drop             ${box_text_not_gr_dropbox_tab_prevent}          ${outer_drop}
    Drag and drop                       ${draggable_el_tab_prevent}                     ${box_not_gr_dropbox_tab_prevent}
    Verify text after drop              ${box_text_not_gr_dropbox_tab_prevent}          ${dropped}
    Get background color after drop     ${box_not_gr_dropbox_tab_prevent}
    Verify color changing               ${element_before_background}                    ${element_after_background}

Check whether OUTER DROPABLE not greedy and INNER DROPABLE not greedy elements change their condition when user inserts DRAG ME element in INNER DROPABLE, in PREVENT PROPOGATION tab
    Open tab                            ${btn_tab_prevent}
    Get background color before drop    ${box_not_gr_inner_dropbox_tab_prevent}
    Verify text before drop             ${box_text_not_gr_inner_dropbox_tab_prevent}    ${inner_drop}
    Verify text before drop             ${box_text_not_gr_dropbox_tab_prevent}          ${outer_drop}
    Drag and drop                       ${draggable_el_tab_prevent}                     ${box_not_gr_inner_dropbox_tab_prevent}
    Verify text after drop              ${box_text_not_gr_inner_dropbox_tab_prevent}    ${dropped}
    Verify text after drop              ${box_text_not_gr_dropbox_tab_prevent}          ${dropped}
    Get background color after drop     ${box_not_gr_inner_dropbox_tab_prevent}
    Verify color changing               ${element_before_background}                    ${element_after_background}

Check whether INNER DROPABLE greedy element changes its condition when user inserts DRAG ME element in OUTER DROPABLE, in PREVENT PROPOGATION tab
    Open tab                            ${btn_tab_prevent}
    Get background color before drop    ${box_not_gr_inner_dropbox_tab_prevent}
    Verify text before drop             ${box_text_not_gr_dropbox_tab_prevent}      ${outer_drop}
    Drag and drop                       ${draggable_el_tab_prevent}                 ${box_not_gr_dropbox_tab_prevent}
    Verify text after drop              ${box_text_not_gr_dropbox_tab_prevent}      ${dropped}
    Get background color after drop     ${box_not_gr_inner_dropbox_tab_prevent}
    Verify color changing               ${element_before_background}                ${element_after_background}

Check whether OUTER DROPABLE greedy element changes its condition when user inserts DRAG ME element in OUTER DROPABLE, in PREVENT PROPOGATION tab
    Open tab                            ${btn_tab_prevent}
    Get background color before drop    ${box_gr_dropbox_tab_prevent}
    Verify text before drop             ${box_text_not_gr_dropbox_tab_prevent}  ${outer_drop}
    Drag and drop                       ${draggable_el_tab_prevent}             ${box_text_gr_dropbox_tab_prevent}
    Verify text after drop              ${box_text_gr_dropbox_tab_prevent}      ${dropped}
    Get background color after drop     ${box_gr_dropbox_tab_prevent}
    Verify color changing               ${element_before_background}            ${element_after_background}

Check whether DROP HERE element changes its condition when user inserts NOT REVERT element in DROP HERE, in REVERT DRAGABLE tab
    Open tab                            ${btn_tab_revert}
    Get background color before drop    ${box_tab_revertable}
    Verify text before drop             ${box_text_tab_revertable}              ${drop_here}
    Drag and drop                       ${notrevertable_el_tab_revertable}      ${box_tab_revertable}
    Verify text after drop              ${box_text_tab_revertable}              ${dropped}
    Get background color after drop     ${box_tab_revertable}
    Verify color changing               ${element_before_background}            ${element_after_background}

Check whether DROP HERE element changes its condition when user inserts WILL REVERT element in DROP HERE, in REVERT DRAGABLE tab
    Open tab                            ${btn_tab_revert}
    Get background color before drop    ${box_tab_revertable}
    Verify text before drop             ${box_text_tab_revertable}              ${drop_here}
    Drag and drop                       ${revertable_el_tab_revertable}         ${box_tab_revertable}
    Verify text after drop              ${box_text_tab_revertable}              ${dropped}
    Get background color after drop     ${box_tab_revertable}
    Verify color changing               ${element_before_background}            ${element_after_background}

Check whether WILL REVERT element comes out of the DROP HERE element, in REVER DRAGABLE tab
    Open tab                            ${btn_tab_revert}
    Get element position before drop    ${revertable_el_tab_revertable}
    Verify text before drop             ${box_text_tab_revertable}              ${drop_here}
    Drag and drop                       ${revertable_el_tab_revertable}         ${box_tab_revertable}
    Verify text after drop              ${box_text_tab_revertable}              ${dropped}
    Get element position after drop     ${revertable_el_tab_revertable}
    Verify position is not changing     ${position_before}                      ${position_after}

Check whether NOT REVERT element doesnt come out of the DROP HERE element, in REVER DRAGABLE tab
    Open tab                            ${btn_tab_revert}
    Get element position before drop    ${notrevertable_el_tab_revertable}
    Verify text before drop             ${box_text_tab_revertable}              ${drop_here}
    Drag and drop                       ${notrevertable_el_tab_revertable}      ${box_tab_revertable}
    Verify text after drop              ${box_text_tab_revertable}              ${dropped}
    Get element position after drop     ${notrevertable_el_tab_revertable}
    Verify position changing            ${position_before}                      ${position_after}