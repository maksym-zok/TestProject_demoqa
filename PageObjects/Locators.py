#Text Box
txt_textboxUserName="id:userName"
txt_textboxUserEmail="id:userEmail"
txt_textboxCurrentAddress="id:currentAddress"
txt_textboxPermanentAddress="id:permanentAddress"
btn_textboxSubmit="id:submit"
output_textboxUserName="//p[@id='name']"
output_textboxEmail="//p[@id='email']"
output_textboxCurrentAddress="//p[@id='currentAddress']"
output_textboxPermanentAddress="//p[@id='permanentAddress']"
output_box="//div[@class='border col-md-12 col-sm-12']"

#Check box
unchecked_checkboxes="//*[@class='rct-icon rct-icon-uncheck']"
unchecked_branches="//*[@class='rct-collapse rct-collapse-btn']"
random_checkbox="//span[@class='rct-checkbox']/*[contains(@class, 'rct-icon rct-icon-')]"

#Radio button
radio_button_yes="//*[@for='yesRadio']"
radio_button_impressive="//*[@for='impressiveRadio']"
radio_button_no="//*[@for='noRadio']"
output_radio="//*[@class='mt-3']"

#Web Tables
first_nameofthelist_in_the_table="(//div[@class='rt-tr -odd']/div[@class='rt-td'])[1]"
third_nameofthelist_in_the_table="(//div[@class='rt-tr -odd']/div[@class='rt-td'])[8]"
text_search="id:searchBox"
btn_new_record="id:addNewRecordButton"
txt_firstname="id:firstName"
txt_lastname="id:lastName"
txt_userEmail="id:userEmail"
txt_userage="id:age"
txt_usersalary="id:salary"
txt_userdepartment="id:department"
btn_submitnewrecord="id:submit"
form_registration="//div[@class='modal-body']"
btn_close="//button[@class='close']"
btn_delete="//div[@class='rt-tr-group']/div/div[starts-with(.,'${id:firstName}')]/../div[@class='rt-td']/div/span[@title='Delete']"
btn_next="//div[@class='-next']/*[text() = 'Next']"
btn_previous="//div[@class='-previous']/*[text() = 'Previous']"
last_page="//span[@class='-totalPages']"
input_jump_to_page="//input[@aria-label='jump to page']"
rows_selector="//select[@aria-label='rows per page']"
addres_of_items="//div[@class='rt-tr-group']"

#Buttons
btn_double="id:doubleClickBtn"
btn_double_message="id:doubleClickMessage"
btn_context="id:rightClickBtn"
btn_context_message="id:rightClickMessage"
btn_one_click="xpath://*[text()='Click Me']"
btn_one_click_message="id:dynamicClickMessage"

#Links
simple_link="id:simpleLink"
dynamic_link="id:dynamicLink"
created_link="id:created"
no_content_link="id:no-content"
moved_link="id:moved"
bad_request_link="id:bad-request"
unauthorized_link="id:unauthorized"
forbidden_link="id:forbidden"
invalid_link="id:invalid-url"
response_link="id:linkResponse"

#Broken_links
img_valid="//div/img[@src='/images/Toolsqa.jpg']"
img_invalid="//div/img[@src='/images/Toolsqa_1.jpg']"
valid_link="//*[text()='Click Here for Valid Link']"
broken_link="//*[text()='Click Here for Broken Link']"

#Upload_Download
UploadFiletest="//*[@type='file']"
img_to_upload="D:/download.jpg"
filename="C:\\fakepath\\download.jpg"
path_upload="id:uploadedFilePath"
bownload_button="id:downloadButton"

#Dynamic_Properties
btn_enabled_in_5s="id:enableAfter"
btn_visiable_in_5s="id:visibleAfter"
btn_color_change_red="//button[@class='mt-4 text-danger btn btn-primary']"
btn_color_change_white="//button[@class='mt-4 btn btn-primary']"

#Practice_form
txt_practice_firstname="id:firstName"
txt_practice_lastname="id:lastName"
txt_practice_userEmail="id:userEmail"
radio_male="//label[text()='Male']"
radio_female="//label[text()='Female']"
radio_other="//label[text()='Other']"
txt_phone_number="id:userNumber"
date_picker="id:dateOfBirthInput"
date_picker_month="class:react-datepicker__month-select"
date_picker_year="class:react-datepicker__year-select"
txt_subject="id:subjectsInput"
checkbox_sports="//label[@for='hobbies-checkbox-1']"
checkbox_reading="//label[@for='hobbies-checkbox-2']"
checkbox_music="//label[@for='hobbies-checkbox-3']"
btn_UploadFile="//input[@id='uploadPicture']"
txt_address="id:currentAddress"
txt_state="id:react-select-3-input"
txt_city="id:react-select-4-input"
btn_delete_subject="//div[contains(@class, 'multi-value__remove')]/*"
output_subject="(//div[contains(@class, 'subjects-auto-complete__multi-value__label')])"
output_hobby_sports="//input[@id='hobbies-checkbox-1']"
output_hobby_reading="//input[@id='hobbies-checkbox-2']"
output_hobby_music="//input[@id='hobbies-checkbox-3']"
output_state="//div[contains(@class, '-singleValue')]"
output_city="//div[@id='city']//div[contains(@class, '-singleValue')]"

output_username="((//tbody/tr)[1]/td)[2]"
output_useremail="((//tbody/tr)[2]/td)[2]"
output_usergender="((//tbody/tr)[3]/td)[2]"
output_userphone="((//tbody/tr)[4]/td)[2]"
output_userdate_of_brth="((//tbody/tr)[5]/td)[2]"
output_user_subject="((//tbody/tr)[6]/td)[2]"
output_userhobby="((//tbody/tr)[7]/td)[2]"
output_userphoto="((//tbody/tr)[8]/td)[2]"
output_useraddress="((//tbody/tr)[9]/td)[2]"
output_user_state_city="((//tbody/tr)[10]/td)[2]"

summary_table="//div[@class='modal-content']"

#Browser_windows
btn_new_tab="id:tabButton"
btn_new_window="id:windowButton"
btn_new_window_about_blank="id:messageWindowButton"

#Alerts
btn_alert="id:alertButton"
btn_time_alert="id:timerAlertButton"
btn_confirmation="id:confirmButton"
btn_promt="id:promtButton"

output_confirm_res="id:confirmResult"
output_promt_res="id:promptResult"

#Frames
win_frames="//iframe"
win_frame_1="//iframe[@id='frame1']"
win_frame_2="//iframe[@id='frame2']"

#Nested_frames
frame_in_frame="//body/iframe"

#Modal_dialogs
btn_open_small_dialog="id:showSmallModal"
btn_open_large_dialog="id:showLargeModal"
btn_close_small_dialog="id:closeSmallModal"
btn_close_large_dialog="id:closeLargeModal"
btn_close_cross="//span[text()='×']"
output_popup_title="//div[@class='modal-title h4']"
small_modal_dialog="//div[@aria-labelledby='example-modal-sizes-title-sm']"
large_modal_dialog="//div[@aria-labelledby='example-modal-sizes-title-lg']"

#Accordian
# xpath_collapse_check1="(//div[@id='section1Content']/..)[last()]"
# xpath_collapse_check2="(//div[@id='section2Content']/..)[last()]"
# xpath_collapse_check3="(//div[@id='section3Content']/..)[last()]"
# btn_accordian_1="id:section1Heading"
# btn_accordian_2="id:section2Heading"
# btn_accordian_3="id:section3Heading"

#Autocomplet
txt_single_color="id:autoCompleteSingleInput"
txt_multiple_colors="id:autoCompleteMultipleInput"
output_single_color="//div[contains(@class, '-singleValue')]"
output_multiple_colors="//div[contains(@class, '-multiValue')]"
btn_remove="//div[contains(@class, '-value__remove')]"
div_to_click="//span[text()='Type single color name']"

#Date_picker
btn_select_date_time="id:dateAndTimePickerInput"
btn_dropdown_month="//span[@class='react-datepicker__month-read-view--down-arrow']"
btn_dropdown_year="//div[@class='react-datepicker__year-read-view']"
pick_time="//li[text()="
pick_month="//div[text()="
pick_year="//div[text()="
pick_hours="//li[contains(text(), "
btn_select_date="id:datePickerMonthYearInput"
output_select_date_time="//input[contains(@value, "
output_select_date="//input[contains(@value, "
output_number_of_days="//div[contains(@aria-label, "
to_click="//div[text()='Select Date']"

#Slider
btn_input_slider="//input[@class='range-slider range-slider--primary']"
output_counter="id:sliderValue"

#Progress_bar
btn_start_stop="id:startStopButton"
btn_reset="id:resetButton"
output_percent="//div[contains(@class, 'progress-bar bg-')]"
output_value_100="//div[text()='100%']"
output_value_40="//div[text()='40%']"
output_value_0="//div[text()='0%']"

#Tabs
btn_tab="//nav[@class='nav nav-tabs']/a"
btn_tab_click="//a[contains(@aria-controls,'demo-tabpane-"
tab_content="//div[contains(@aria-labelledby, 'demo-tab-"

#Tool_tips
btn_hover="id:toolTipButton"
find_text="//div[text()="
tooltip_inner="//div[@class='tooltip-inner']"

#Menu
btn_menu_item_a="//ul[@id='nav']//a"
btn_menu_item_li="//ul[@id='nav']//li"

#Sortable
btn_list="//a[text()='List']"
btn_grid="//a[text()='Grid']"
grid_items="//div[@id='demo-tabpane-grid']//div[@class='list-group-item list-group-item-action']"
list_items="//div[@id='demo-tabpane-list']//div[@class='list-group-item list-group-item-action']"
list_items_by_text="//div[@id='demo-tabpane-list']//div[text()="
grid_items_by_text="//div[@id='demo-tabpane-grid']//div[text()="

#Selectable
btn_selectable_list="//a[text()='List']"
btn_selectable_grid="//a[text()='Grid']"
list_selectable_items="//div[@id='demo-tabpane-list']//li"
grid_selectable_items="//div[@id='demo-tabpane-grid']//li"

#Resizable
resizable_box_with_restriction="//div[@id='resizableBoxWithRestriction']"
btn_resizable_box_with_restriction="//div[@id='resizableBoxWithRestriction']/span"
resizable_box_without_restriction="//div[@id='resizable']"
btn_resizable_box_without_restriction="//div[@id='resizable']/span"

#Droppable
btn_tab_revert="//a[text()='Revert Draggable']"
btn_tab_simple="//a[text()='Simple']"
btn_tab_accept="//a[text()='Accept']"
btn_tab_prevent="//a[text()='Prevent Propogation']"
box_tab_revertable="//div[@class='revertable-drop-container']/div[@id='droppable']"
box_tab_simple="//div[@id='simpleDropContainer']/div[@id='droppable']"
box_tab_accept="//div[@class='accept-drop-container']/div[@id='droppable']"
box_not_gr_dropbox_tab_prevent="//div[@id='notGreedyDropBox']"
box_gr_dropbox_tab_prevent="//div[@id='greedyDropBox']"
box_not_gr_inner_dropbox_tab_prevent="//div[@id='notGreedyInnerDropBox']"
box_text_tab_revertable="//div[@class='revertable-drop-container']/div[@id='droppable']/p"
box_text_tab_simple="//div[@id='simpleDropContainer']/div[@id='droppable']/p"
box_text_tab_accept="//div[@class='accept-drop-container']/div[@id='droppable']/p"
box_text_not_gr_dropbox_tab_prevent="//div[@id='notGreedyDropBox']/p"
box_text_not_gr_inner_dropbox_tab_prevent="//div[@id='notGreedyInnerDropBox']/p"
box_text_gr_dropbox_tab_prevent="//div[@id='greedyDropBox']/p"
revertable_el_tab_revertable="//div[@id='revertable']"
notrevertable_el_tab_revertable="//div[@id='notRevertable']"
draggable_el_tab_simple="//div[@id='draggable']"
not_acceptable_el_tab_accept="//div[@id='notAcceptable']"
acceptable_el_tab_accept="//div[@id='acceptable']"
draggable_el_tab_prevent="//div[@id='dragBox']"

#Dragabble
btn_tab_simple_drag="//a[@id='draggableExample-tab-simple']"
btn_tab_axis_drag="//a[@id='draggableExample-tab-axisRestriction']"
btn_tab_container_drag="//a[@id='draggableExample-tab-containerRestriction']"
box_tab_simple_drag="//div[@id='dragBox']"
box_tab_axisX_drag="//div[@id='restrictedX']"
box_tab_axisY_drag="//div[@id='restrictedY']"
box_tab_container_wbox_drag="//div[@class='draggable ui-widget-content ui-draggable ui-draggable-handle']"
box_tab_container_wparent_drag="//span[@class='ui-widget-header ui-draggable ui-draggable-handle']"
