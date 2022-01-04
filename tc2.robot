*** Settings ***
Library		SeleniumLibrary

*** Variables ***
${website}	https://www.tutorialspoint.com/
${number}	100


*** Test Cases ***
TC1
   Create Webdriver    Chrome    executable_path=C:/Users/internntrantuyen/Documents/Selenium/SeDrivers/chromedriver.exe
   Open Browser		${website}	Chrome
   Maximize Browser Window
   Close Browser
TC2
   ${a}		Set Variable	Hi
   Log To Console	${a}
   ${b} 	Set Variable	If ${number}>0 Yes No
   Log To Console	${b}