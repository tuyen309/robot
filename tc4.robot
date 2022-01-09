***Settings***
Library		SeleniumLibrary

*** Variables ***
${URL}	https://www.expedia.com/
${BROWSER}        Chrome
${leaving_from}   Ha Noi
${Going_to}    Da Nang
${Local_HaNoi}    .//ul[@class='no-bullet']//button[contains(string(), 'Noi Bai')]
${Local_DaNang}    .//ul[@class='no-bullet']//button[contains(string(), 'Da Nang')]
${verify_mess}    Hanoi (HAN) - Da Nang (DAD)
${verify_local}   xpath=.//div[@data-test-id="arrival-departure"] 
@{pricelist}
 


*** Test Cases ***
TC1
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
   Click Element    xpath=.//select[@id="listings-sort"]/option[contains(string(), "Price (Lowest)")]

   FOR    ${i}    IN RANGE    1    9
       ${Priceitem}     Get Text    xpath=.//ul/li[${i}]//span[@class="uitk-lockup-price"]
       ${Priceitem}     Split String	${Priceitem}    $
       ${Priceitem}    ${Priceitem}[1]
       Append To List    @{pricelist}    ${Priceitem}
    END   


   ${verify_local}    xpath=.//div[@data-test-id="arrival-departure"]
   IF    '${verify_local}' == '${verify_mess}'
   Log To Console    Pass
   ELSE
   Log To Console    Fail
   END
    
    

  
   
   
   
   