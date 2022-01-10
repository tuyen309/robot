*** Settings ***
Library		SeleniumLibrary
Library    String
Library    Collections

***Variable***
   
*** Test Cases ***
TC1
   @{RESPONSE_LIST}=    Create List    
   Log    ${RESPONSE_LIST}
   ${string}    Set Variable   $100
   ${strings}=    Split String	${string}    $
   ${x}=    Get From List    ${strings}    1	
   Append To List  ${RESPONSE_LIST}    ${x}
   Log    ${RESPONSE_LIST}
  