***Settings***
Library		SeleniumLibrary
Library         DateTime

*** Variables ***
${URL}	https://www.expedia.com/
${BROWSER}        Chrome
${leaving_from}   Ha Noi
${Going_to}    Ho Chi Minh City
${Local_HaNoi}    .//ul[@class='no-bullet']//button[contains(string(), 'Noi Bai')]
${today}    Get Current Date    

${target_day}    Get Current Date    result_format=%d
${previous_click}   .//*[@class="uitk-calendar"]/div/button[1]
${verify_mess}    Hanoi (HAN) - Ho Chi... (SGN)
${verify_local}   xpath=.//div[@data-test-id="arrival-departure"] 
 


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
   Input Text    xpath=.//input[@placeholder="Where are you going to?"]    ${Going_to}    /ENTER
   Sleep    3
   Click Button    id:d1-btn
   Sleep    3
   ${month}    Get Text    xpath=.//*[@class="uitk-calendar"]//h2
   ${datetime}    Convert Date    20220106 09:15:00    result_format = %d %m %Y %I:%M %p
   Log To Console    ${datetime}
   Log To Console    ${today}
   Log To Console    ${month}
   Log To Console    ${target_month}
   IF   ${month}    ==    ${target_month}
   Click Button    xpath=.//*[@data-day="+${target_day}+"]
   ELSE
   Click Button    ${previous_click}
   Sleep    2
   ${month}    Get Text    /xpath=.//*[@class="uitk-calendar"]//h2
       IF ${month} == ${target_month}
       Click Element     xpath=.//*[@data-day="+${target_day}+"]
       Click Element     xpath=.//button[@data-stid="apply-date-picker"]
       END
    END
    Click Button    xpath=.//button[@data-testid="submit-button"]
    
    

  
   
   
   
   