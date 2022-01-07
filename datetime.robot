*** Settings ***
Library    DateTime



*** Test Cases ***
TC1
   ${target_month}     Get Current Date    result_format=%B %Y
   ${target_day}     Get Current Date    result_format=datetime

   Log To Console    ${target_day.day}
   Log To Console    ${target_month}
