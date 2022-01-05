***Settings***
Library		SeleniumLibrary

*** Variables ***
${URL}	https://www.expedia.com/
${BROWSER}        Chrome
${leaving_from}   Ha Noi
${Going_to}    Ho Chi Minh City
${Local_HaNoi}    .//ul[@class='no-bullet']//button[contains(string(), 'Noi Bai')]

*** Test Cases ***
TC1
   Open Browser		${URL}		${BROWSER}
   Click Element    xpath=.//button[contains(string(),"More travel")]
   Sleep  5s
   Click Element    xpath=.//a[@href="/Flights"]
   Sleep 30s
   Click Element    xpath=.//button[@aria-label="Leaving from"]
   Input Text    xpath=.//input[@placeholder="Where are you leaving from?"]    ${leaving_from}
   Sleep 5s
   Click Element    xpath=${Local_HaNoi} 
   Sleep 5s
   Click Element    xpath=.//button[@aria-label="Going to"]
   Input Text    xpath=.//input[@placeholder="Where are you going to?"]    ${Going_to}    /ENTER
   Sleep 3s
   Click Element    id:d1-btn
   Sleep 3s