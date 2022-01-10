*** Settings ***
Library		SeleniumLibrary
Library    String
Library    Collections

***Variable***
   
*** Test Cases ***
TC1
   @{timelist}=    Create List
   ${time}    Set Variable    13h 25m (1 stop)
   ${times}=     Split String    ${time}    
   ${time_h}=    Get From List    ${times}    0
   ${time_h}=    Split String    ${time_h}   h
   ${time_h}=    Get From List    ${time_h}    0
   ${time_m}=    Get From List    ${times}    1
   ${time_m}=    Split String    ${time_m}    m
   ${time_m}=    Get From List    ${time_m}    0
   ${time_h}=    Evaluate    ${time_h} * 60
   ${time_target}=    Evaluate    ${time_h} + ${time_m}
   Append To List    ${timelist}    ${time_target}
  
  