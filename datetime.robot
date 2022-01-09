*** Settings ***
Library    DateTime



*** Test Cases ***
TC1
   ${target_month}     Get Current Date    result_format=%B %Y
   ${target_day}     Get Current Date    result_format=datetime
   ${target_next_day}    Evaluate        ${target_day.day}+${1}
   Log To Console    ${target_next_day}
   Log To Console    ${target_month}
