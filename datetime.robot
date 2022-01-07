*** Settings ***
Library    DateTime



*** Test Cases ***
TC1
   ${target_month}     Get Current Date    result_format=%B %Y
   ${target_day}     Get Current Date    result_format=%d
   ${ABC}  Set Variable    ${target_month}
   Log To Console    ${target_day}
   Log To Console    ${ABC}
   Log To Console    ${target_month}
