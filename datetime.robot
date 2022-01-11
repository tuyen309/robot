*** Settings ***
Library		SeleniumLibrary
Library    String
Library    Collections

***Variable***
   
*** Test Cases ***
TC1
   @{timelist}=    Create List    1   2    3    4    5   6   7   8   9
   ${length_list}=  Get length   ${timelist}
   FOR    ${i}    IN RANGE    ${length_list}-1
      FOR   ${j}    IN RANGE    ${i}+1    ${length_list}
         ${timelist_i}    Get From List    ${timelist}    ${i}
         ${timelist_j}    Get From List    ${timelist}    ${j}
         IF    '${timelist_i}' >= '${timelist_j}'
         Log To Console    OK
         END 
      END
   END
   
  