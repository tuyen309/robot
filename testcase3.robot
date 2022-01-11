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
TC3
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
   Click Element    xpath=.//select[@id="listings-sort"]/option[contains(string(), "Price (Highest)")]
   Sleep    6
   @{pricelist}=    Create List
   FOR    ${i}    IN RANGE    1    9
       ${Priceitem}     Get Text    xpath=.//ul/li[${i}]//span[@class="uitk-lockup-price"]
       ${Priceitems}=     Split String    ${Priceitem}    $
       ${Priceitem_addlist}=    Get From List    ${Priceitems}    1
       Append To List    ${pricelist}    ${Priceitem_addlist}
    END   
 
   # FOR    ${j}    IN RANGE    1    9
   #    ${verify_local}    Get Text    xpath=.//ul/li[${j}]//div[@data-test-id="arrival-departure"]
   # END    
   ${length_list}=  Get length   ${pricelist}
   # ${verify_local}    xpath=.//div[@data-test-id="arrival-departure"]
   
   # IF    '${verify_local}' == '${verify_mess}'
      FOR    ${i}    IN RANGE    ${length_list}-1
         FOR   ${j}    IN RANGE    ${i}+1    ${length_list}
            ${pricelist_i}    Get From List    ${pricelist}    ${i}
            ${pricelist_j}    Get From List    ${pricelist}    ${j}
            ${verify_local}    Get Text    xpath=.//ul/li[${j}]//div[@data-test-id="arrival-departure"]
            IF    '${pricelist_i}' >= '${pricelist_j}'
               IF    '${verify_local}' == '${verify_mess}'
               Log To Console    OK   
               END   
            END   
         END
      END
    
    

  
   
   
   
   