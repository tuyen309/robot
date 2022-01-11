***Settings***
Library		SeleniumLibrary
Library    String
Library    Collections

*** Variables ***
${URL}	https://www.expedia.com/
${BROWSER}        Chrome
${leaving_from}   Ha Noi
${Going_to}    Da Nang
${Local_HaNoi}    .//ul[@class='no-bullet']//button[contains(string(), 'Noi Bai')]
${Local_DaNang}    .//ul[@class='no-bullet']//button[contains(string(), 'Da Nang')]
${verify_mess}    Hanoi (HAN) - Da Nang (DAD)


 


*** Test Cases ***
TC4
   Open Browser		${URL}		${BROWSER}
   Click Element    xpath=.//button[contains(string(),"More travel")]
   Sleep  5s
   Click Element    xpath=.//a[@href="/Flights"]
   BuiltIn.Sleep    45s
   Click Element    xpath=.//button[@aria-label="Leaving from"]
   Input Text    xpath=.//input[@placeholder="Where are you leaving from?"]    ${leaving_from}
   Sleep    2
   Click Element    xpath=${Local_HaNoi} 
   Sleep    5
   Click Element    xpath=.//button[@aria-label="Going to"]
   Input Text    xpath=.//input[@placeholder="Where are you going to?"]    ${Going_to}
   Sleep    2
   Click Element    xpath=${Local_DaNang}  
   Sleep    3
   Click Element     xpath=.//button[contains(text(), 'Search')]    
   Sleep    30
   Click Element    xpath=.//select[@id="listings-sort"]
   Sleep    1
   Click Element    xpath=.//select[@id="listings-sort"]/option[contains(string(), "Duration (Shortest)")]
   Sleep    5
   @{timelist}=    Create List
   FOR    ${i}    IN RANGE    1    9
       ${time}     Get Text    xpath=.//ul[@data-test-id="listings"]/li[${i}]//div[@data-test-id="journey-duration"]
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
  
    END   
 
   ${length_list}=  Get length   ${timelist}
   # ${verify_local}    xpath=.//div[@data-test-id="arrival-departure"]
   
   # IF    '${verify_local}' == '${verify_mess}'
      FOR    ${i}    IN RANGE    ${length_list}-1
         FOR   ${j}    IN RANGE    ${i}+1    ${length_list}
            ${timelist_i}    Get From List    ${timelist}    ${i}
            ${timelist_j}    Get From List    ${timelist}    ${j}
            ${verify_local}    Get Text    xpath=.//ul/li[${j}]//div[@data-test-id="arrival-departure"]
            IF    '${timelist_i}' <= '${timelist_j}'
               IF    '${verify_local}' == '${verify_mess}'
               Log To Console    OK   
               END   
            END   
         END
      END
    
    

  
   
   
   
   