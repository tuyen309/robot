***Settings***
Library		SeleniumLibrary
Library    DateTime

*** Variables ***
${URL}	https://www.expedia.com/
${BROWSER}        Chrome
${leaving_from}   Ha Noi
${Going_to}    Ho Chi Minh City
${Local_HaNoi}    .//ul[@class='no-bullet']//button[contains(string(), 'Noi Bai')]
${Local_HCM}    .//ul[@class='no-bullet']//button[contains(string(), 'Tan Son Nhat')]
${previous_click}   .//*[@class="uitk-calendar"]/div/button[1]
${verify_mess}    Hanoi (HAN) - Ho Chi... (SGN)
${verify_local}   xpath=.//div[@data-test-id="arrival-departure"] 
${verify_mess}    Hanoi (HAN) - Ho Chi... (SGN)
 


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
   Click Element    xpath=${Local_HCM}  
   Sleep    3
   Click Button    id:d1-btn
   Sleep    3
   ${month}    Get Text    xpath=.//*[@class="uitk-calendar"]//h2
   ${target_month}     Get Current Date    result_format=%B %Y
   ${target_day}     Get Current Date    result_format=datetime
   Log To Console    ${target_day.day}
   Log To Console    ${month}
   Log To Console    ${target_month}
   IF   '${month}' == '${target_month}'
   Click Element    xpath=.//*[@data-day="${target_day.day}"]
   Sleep    1
   ELSE
   Click Element    ${previous_click}
   Sleep    2 
   ${month}    Get Text    /xpath=.//*[@class="uitk-calendar"]//h2
       IF    '${month}' == '${target_month}'
       Click Element     xpath=.//*[@data-day="${target_day.day}"]
       Sleep    1
       END
   END
   Click Element    xpath=.//button[@data-stid="apply-date-picker"]
   Sleep    3
   Click Element     xpath=.//button[contains(text(), 'Search')]    
   Sleep    30
   ${verify_local}    Get Text     xpath=.//div[@data-test-id="arrival-departure"]
   IF    '${verify_local}' == '${verify_mess}'
   Log To Console    Pass
   ELSE
   Log To Console    Fail
   END
    
    

  
   
   
   
   