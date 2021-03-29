*** Settings ***

Library     RequestsLibrary
Library     Collections
*** Variables ***

${base_url}=     https://demoqa.com


*** Test Cases ***

Get_listofbooks
    create session  myssion     ${base_url}
       ${response}=     get request     myssion    BookStore/v1/Book?ISBN=9781449325862

       log to console   ${response.status_code}
       log to console   ${response.content}
       log to console   ${response.headers}
