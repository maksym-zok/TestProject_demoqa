*** Settings ***
Library                 Collections
Library                 RequestsLibrary

*** Variables ***
${base_url}                 https://demoqa.com/
${browser}                  chrome
${elements}                 xpath:(//div[@class='avatar mx-auto white'])[1]/*[name()='svg']
${forms}                    xpath:(//div[@class='avatar mx-auto white'])[2]/*[name()='svg']
${alerts_frame}             xpath:(//div[@class='avatar mx-auto white'])[3]/*[name()='svg']
${text_box}                 xpath://div[@class='element-list collapse show']/ul/li[@id='item-0']/*[name()='svg']
${check_box}                xpath://div[@class='element-list collapse show']/ul/li[@id='item-1']/*[name()='svg']
${radio_buttons}            xpath://div[@class='element-list collapse show']/ul/li[@id='item-2']/*[name()='svg']
${web_tables}               xpath://div[@class='element-list collapse show']/ul/li[@id='item-3']/*[name()='svg']
${buttons}                  xpath://div[@class='element-list collapse show']/ul/li[@id='item-4']/*[name()='svg']
${links}                    xpath://div[@class='element-list collapse show']/ul/li[@id='item-5']/*[name()='svg']
${broken_li_im}             xpath://div[@class='element-list collapse show']/ul/li[@id='item-6']/*[name()='svg']
${download_upload}          xpath://div[@class='element-list collapse show']/ul/li[@id='item-7']/*[name()='svg']
${dynamic_properties}       xpath://div[@class='element-list collapse show']/ul/li[@id='item-8']/*[name()='svg']
${practice_form}            xpath://div[@class='element-list collapse show']/ul/li[@id='item-0']/*[name()='svg']
${browser_windows}          xpath://div[@class='element-list collapse show']/ul/li[@id='item-0']/*[name()='svg']
${alerts}                   xpath://div[@class='element-list collapse show']/ul/li[@id='item-1']/*[name()='svg']

${valid_phone_number}       0964654654
${invalid_phone_number}     asd5asd
${valid_username}           MAX
${valid_email}              testingdemoqa@gmail.com
${invalid_email}            testingdemoqa@.com
${valid_cur_address}        In the middle of nowhere
${valid_per_address}        Somewhere in Mordor
${response_data_text_box}   xpath://div[@class="border col-md-12 col-sm-12"]

${id:firstName}             Mariana
${id:firstName_edited}      Katia
${id:lastName}              Zenzen
${id:userEmail}             neuzelivsamom@gmail.com
${invalid_age}              520
${id:age}                   12
${id:salary}                26
${id:department}            DEPARTAMENT NICHOGO NEROBLENNIA