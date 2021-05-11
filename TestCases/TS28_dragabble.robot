*** Settings ***
Library                 BuiltIn
Library                 Collections
Library                 SeleniumLibrary
Resource                ../Bindings/keywords.robot
Resource                ../Resources/variables.robot
Resource                ../Resources/TS28_dragabble_keywords.robot
Test Setup              Start browser and maximaze  https://demoqa.com/dragabble
Test Teardown           close browser

*** Test Cases ***
Check whether user is able to move element DRAG ME to the top left corner, in simple tab
    Open tab                            ${btn_tab_simple_drag}
    Drag and drop by offset             ${box_tab_simple_drag}      ${left_200}     ${top_200}
    Validate the element position       ${box_tab_simple_drag}      ${left_200}     ${top_200}

Check whether user is able to move element DRAG ME to the top right corner, in simple tab
    Open tab                            ${btn_tab_simple_drag}
    Drag and drop by offset             ${box_tab_simple_drag}      ${right_200}    ${top_200}
    Validate the element position       ${box_tab_simple_drag}      ${right_200}    ${top_200}

Check whether user is able to move element DRAG ME to the bottom left corner, in simple tab
    Open tab                            ${btn_tab_simple_drag}
    Drag and drop by offset             ${box_tab_simple_drag}      ${left_200}     ${bottom_200}
    Validate the element position       ${box_tab_simple_drag}      ${left_200}     ${bottom_200}

Check whether user is able to move element DRAG ME to the bottom right corner, in simple tab
    Open tab                            ${btn_tab_simple_drag}
    Drag and drop by offset             ${box_tab_simple_drag}      ${right_200}    ${bottom_200}
    Validate the element position       ${box_tab_simple_drag}      ${right_200}    ${bottom_200}

Check whether user is able to move element ONLY X to the left on the x-axis, in Axis Restricted tab
    Open tab                            ${btn_tab_axis_drag}
    Drag and drop by offset             ${box_tab_axisX_drag}      ${left_200}      ${zero}
    Validate the element position       ${box_tab_axisX_drag}      ${left_200}      ${zero}

Check whether user is able to move element ONLY X to the right on the x-axis, in Axis Restricted tab
    Open tab                            ${btn_tab_axis_drag}
    Drag and drop by offset             ${box_tab_axisX_drag}      ${right_200}     ${zero}
    Validate the element position       ${box_tab_axisX_drag}      ${right_200}     ${zero}

Check whether user is unable to move element ONLY X to the top on the y-axis, in Axis Restricted tab
    Open tab                            ${btn_tab_axis_drag}
    Drag and drop by offset             ${box_tab_axisX_drag}      ${zero}      ${top_200}
    Validate the element position       ${box_tab_axisX_drag}      ${zero}      ${zero}

Check whether user is unable to move element ONLY X to the bottom on the y-axis, in Axis Restricted tab
    Open tab                            ${btn_tab_axis_drag}
    Drag and drop by offset             ${box_tab_axisX_drag}      ${zero}      ${bottom_200}
    Validate the element position       ${box_tab_axisX_drag}      ${zero}      ${zero}

Check whether user is able to move element ONLY Y to the top on the y-axis, in Axis Restricted tab
    Open tab                            ${btn_tab_axis_drag}
    Drag and drop by offset             ${box_tab_axisY_drag}      ${zero}      ${top_200}
    Validate the element position       ${box_tab_axisY_drag}      ${zero}      ${top_200}

Check whether user is able to move element ONLY Y to the bottom on the y-axis, in Axis Restricted tab
    Open tab                            ${btn_tab_axis_drag}
    Drag and drop by offset             ${box_tab_axisY_drag}      ${zero}      ${bottom_200}
    Validate the element position       ${box_tab_axisY_drag}      ${zero}      ${bottom_200}

Check whether user is unable to move element ONLY Y to the left on the x-axis, in Axis Restricted tab
    Open tab                            ${btn_tab_axis_drag}
    Drag and drop by offset             ${box_tab_axisY_drag}      ${left_200}  ${zero}
    Validate the element position       ${box_tab_axisY_drag}      ${zero}      ${zero}

Check whether user is unable to move element ONLY Y to the right on the x-axis, in Axis Restricted tab
    Open tab                            ${btn_tab_axis_drag}
    Drag and drop by offset             ${box_tab_axisY_drag}      ${right_200}  ${zero}
    Validate the element position       ${box_tab_axisY_drag}      ${zero}       ${zero}

Check whether user is able to move element contained within the box inside that box, in Container Restricted tab
    Open tab                            ${btn_tab_container_drag}
    Drag and drop by offset             ${box_tab_container_wbox_drag}      ${right_50}     ${bottom_50}
    Validate the element position       ${box_tab_container_wbox_drag}      ${right_50}     ${bottom_50}

Check whether user is able to move element contained whithin the box to the edge of the box, in Container Restricted tab
    Open tab                            ${btn_tab_container_drag}
    Drag and drop by offset             ${box_tab_container_wbox_drag}      ${zero}         ${bottom_edge_within_the_box}
    Validate the element position       ${box_tab_container_wbox_drag}      ${zero}         ${bottom_edge_within_the_box}

Check whether user is unable to move element contained whithin the box out of the box, in Container Restricred tab
    Open tab                            ${btn_tab_container_drag}
    Drag and drop by offset             ${box_tab_container_wbox_drag}      ${right_800}    ${top_200}
    Validate the element position with invalid expected result       ${box_tab_container_wbox_drag}      ${right_800}    ${top_200}

Check whether user is able to move element contained within parent inside that box, in Container Restricted tab
    Open tab                            ${btn_tab_container_drag}
    Drag and drop by offset             ${box_tab_container_wparent_drag}      ${right_5}    ${bottom_5}
    Validate the element position       ${box_tab_container_wparent_drag}      ${right_5}    ${bottom_5}

Check whether user is able to move element contained whithin parent to the edge of the box, in Container Restricted tab
    Open tab                            ${btn_tab_container_drag}
    Drag and drop by offset             ${box_tab_container_wparent_drag}      ${zero}      ${bottom_86}
    Validate the element position       ${box_tab_container_wparent_drag}      ${zero}      ${bottom_86}

Check whether user is unable to move element contained whithin parent out of the box, in Container Restricred tab
    Open tab                            ${btn_tab_container_drag}
    Drag and drop by offset             ${box_tab_container_wparent_drag}      ${right_800}  ${top_200}
    Validate the element position with invalid expected result       ${box_tab_container_wparent_drag}      ${right_800}    ${top_200}
