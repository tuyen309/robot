***Settings***
Library		SeleniumLibrary

*** Variables ***
${url}	https://www.expedia.com/
${leaving_from}    Ha Noi

*** Test Cases ***
TC1
   Create Webdriver    Chrome    executable_path=C:/Users/internntrantuyen/Documents/Selenium/SeDrivers/chromedriver.exe
   Open Browser		${url}	Chrome
   Maximize Browser Window
   Click Element    xpath=.//button[contains(string(),"More travel")]
   Sleep  5s
   Click Element    xpath=.//a[@href="/Flights"]
   Sleep 30s
   Click Element    xpath=.//button[@aria-label="Leaving from"]
   Input Text    .//input[@placeholder="Where are you leaving from?"]    ${leaving_from}