*** Settings ***
Library                 Collections
Library                 RequestsLibrary

*** Variables ***
@{STATE}    NCR   Uttar Pradesh     Haryana  Rajasthan
@{STAT}    NC   Uttar Prades     Harya  Rajasth
@{STATE_NCR}    Delhi   Gurgaon  Noida
@{STATE_NC}    Delh   Gurgao  Noid
@{LIST}   Blue    Black    Green    Aqua    Red     Indigo  White   Yellow  Violet
@{LIS}    Blu     Blac     Gree     Aqu     Re      Indig   Whit    Yello   Viole
@{LIS_SUBJECTS}    Math    Chemist  Comput  Commer  Econom
@{LIST_SUBJECTS}    Maths    Chemistry  Computer Science  Commerce  Economics
@{INVALID_COLOR}    Bluse    Blacak    Greefn    Aqufga    Refgd     Indifgo  Whwwte   Yelalow  Vioalet
@{DAYth}    0  1st  2nd  3rd  4th  5th  6th  7th  8th  9th  10th  11th  12th  13th  14th  15th  16th  17th  18th  19th  20th  21st  22nd  23rd  24th  25th  26th  27th  28th  29th  30th  31st
@{DAY}      0  1  2  3  4  5  6  7  8  9  10  11  12  13  14  15  16  17  18  19  20  21  22  23  24  25  26  27  28  29  30  31
@{MONTH}    0  January  February  March  April  May  June  July  August  September  October  November  December
@{HOURS}    0  0:00    0:15   0:30   0:45   1:00   1:15   1:30   1:45   2:00   2:15   2:30   2:45   3:00   3:15   3:30   3:45   4:00   4:15   4:30   4:45   5:00   5:15   5:30   5:45
...         6:00   6:15   6:30   6:45   7:00   7:15   7:30   7:45   8:00   8:15   8:30   8:45   9:00   9:15   9:30   9:45   10:00   10:15   10:30   10:45   11:00   11:15   11:30   11:45
...         12:00   12:15   12:30   12:45   13:00   13:15   13:30   13:45   14:00   14:15   14:30   14:45   15:00   15:15   15:30   15:45   16:00   16:15   16:30   16:45   17:00   17:15   17:30   17:45
...         18:00   18:15   18:30   18:45   19:00   19:15   19:30   19:45   20:00   20:15   20:30   20:45   21:00   21:15   21:30   21:45   22:00   22:15   22:30   22:45   23:00   23:15   23:30   23:45
@{tooltips_locators}  0  //button[@id="toolTipButton"]  //input[@id="toolTipTextField"]    (//div[@id="texToolTopContainer"]/a)[1]     (//div[@id="texToolTopContainer"]/a)[2]
@{hover_messages}  0     You hovered over the Button    You hovered over the text field    You hovered over the Contrary                You hovered over the 1.10.32


#${res}
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
${invalid_phone_number_1_digit}  1
${invalid_phone_number_9_digit}  123456789
${invalid_phone_number}     asd5asd
${valid_username}           MAX
${valid_email}              testingdemoqa@gmail.com
${invalid_email}            testingdemoqa@.com
${valid_255char_address}    In the middle of nowhereIn the middle of nowhereIn the middle of nowhereIn the middle of nowhereIn the middle of nowhereIn the middle of nowhereIn the middle of nowhereIn the middle of nowhereIn the middle of nowhereIn the middle of nowhereIn the middle s
${invalid_256char_address}  In the middle of nowhereIn the middle of nowhereIn the middle of nowhereIn the middle of nowhereIn the middle of nowhereIn the middle of nowhereIn the middle of nowhereIn the middle of nowhereIn the middle of nowhereIn the middle of nowhereIn the middle ss
${valid_1char_address}      N
${valid_cur_address}        In the middle of nowhere
${valid_per_address}        Somewhere in Mordor
${response_data_text_box}   xpath://div[@class="border col-md-12 col-sm-12"]
${deleted_username}         DdeletedUSER!1232
${deleted_pass}             deletedUSER!1232
${willbedeleted_username}   willbeDdeletedUSER!1232
${willbedeleted_pass}       willbedeletedUSER!1232
${existed_valid_username}   MAXIMmax123!s
${existed_valid_pass}       MAXIMmax123!s
${existed_valid_userid}     88718c4d-6f5f-435a-a807-bdb044658521
${loginout_username}        loginoutuser
${loginout_pass}            loginOUTpass!123
${validusername255char}     MAxMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAX
${validpass255char}         max12!XMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXASAASSASSSS
${invalidusername256char}   mMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAX
${invalidpass256char}       mmax12!XMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXMAXASAASSASSSS
${validusername1char}       J

${id:firstName}             Mariana
${id:firstName_edited}      Katia
${id:lastName}              Zenzen
${id:userEmail}             neuzelivsamom@gmail.com
${invalid_age}              lol
${id:age}                   12
${id:salary}                26
${id:department}            DEPARTAMENT NICHOGO NEROBLENNIA

${rgba_red}                 rgba(220, 53, 69, 1)
${rgb_red}                  rgb(220, 53, 69)
${white}                    rgba(255, 255, 255, 1)

${msg_double}               You have done a double click
${msg_context}              You have done a right click
${msg_one_click}            You have done a dynamic click


${web_site_title}           ToolsQA
${code_201}                 Link has responded with staus 201 and status text Created
${code_204}                 Link has responded with staus 204 and status text No Content
${code_301}                 Link has responded with staus 301 and status text Moved Permanently
${code_400}                 Link has responded with staus 400 and status text Bad Request
${code_401}                 Link has responded with staus 401 and status text Unauthorized
${code_403}                 Link has responded with staus 403 and status text Forbidden
${code_404}                 Link has responded with staus 404 and status text Not Found