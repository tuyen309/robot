*** Settings ***
Library    SeleniumLibrary
resource  variable.robot 
Suite Setup    Open Browser    https://demoqa.com/    chrome
Suite Teardown    Close Browser
*** Test Cases ***
Access to Forms page
    Maximize Browser Window
    Wait Until Element Is Visible    xpath://h5[text() = 'Forms']
    Execute JavaScript  window.scrollBy(0,3000)
    Click Element    xpath://h5[text() = 'Forms']
    Wait Until Element Is Visible   xpath://span[text()='Practice Form']
    Execute JavaScript    window.scrollBy(0,3000)
    Click Element   xpath://span[text()='Practice Form']
    Wait Until Page Contains Element  xpath=//input[@id='firstName']
    Input Text  xpath=//input[@id='firstName']  John
    Input Text  xpath=//input[@id='lastName']  Smith
    Input Text  xpath=//input[@id='userEmail']  john.smith@example.com
    Click Element  xpath=//label[@for='gender-radio-1']
    Input Text  xpath=//input[@id='userNumber']  1234567890
    Input Text  xpath=//textarea[@id='currentAddress']  1234 Main St
     Wait Until Element Is Visible  xpath=//input[@id='subjectsInput']
    Execute JavaScript  window.scrollBy(0,3000)
    Input Text  xpath=//input[@id='subjectsInput']  English
    Press Keys  xpath=//input[@id='subjectsInput']  RETURN
    Wait Until Element Is Visible    //input[@id='dateOfBirthInput']
    Click Element    //input[@id='dateOfBirthInput']
    Wait Until Element Is Visible    //div[@class='react-datepicker__month-container']
   Click Element    //div[@class='react-datepicker__day react-datepicker__day--027']
    Input Text  xpath=//textarea[@id='currentAddress']  1234 Main Street
    Choose File   xpath=//input[@type='file']   C:/Users/TRAN THI THUY NHIEN/OneDrive/Tài liệu/BT Vong Lap/BangCuuChuong
    Click Element    xpath=//label[contains(text(), 'Sports')]
    Click Element    xpath=//label[contains(text(), 'Music')]
    Execute JavaScript    document.getElementById("fixedban").remove();
    Execute JavaScript    document.querySelector("footer").remove();
    Click Element   xpath=//div[@class=' css-1hwfws3']//div[contains(text(), 'Select State')]
    Click Element  xpath=//div[contains(text(), 'NCR')]
    Click Element   xpath=//div[@class=' css-1hwfws3']//div[contains(text(), 'Select City')]
    Click Element  xpath=//div[contains(text(),'Delhi')]
    Click Element   xpath=//button[@type='submit']
    sleep  4s
verify
    ${actualResult}=    Get Text    //td[text()='Student Name']//..//td[2]
    Should Be Equal    ${actualResult}   ${studentName} 
    ${actualResult}=    Get Text    //td[text()='Student Email']//..//td[2]
    Should Be Equal    ${actualResult}  ${studentEmail}
    ${actualResult}=    Get Text  //td[text()='Mobile']//..//td[2]
    Should Be Equal    ${actualResult}  ${Mobile}
    ${actualResult}=    Get Text    //td[text()='Gender']//..//td[2]
    ${actualResult}=    Get Text    //td[text()='Date of Birth']//..//td[2]
    Should Be Equal    ${actualResult}    ${DateofBirth}
    ${actualResult}=    Get Text    //td[text()='Subjects']//..//td[2]
    Should Be Equal    ${actualResult}    ${Subject}
    ${actualResult}=    Get Text    //td[text()='Hobbies']//..//td[2]
    Should Be Equal    ${actualResult}    ${Hobbies}
    ${actualResult}=    Get Text    //td[text()='Picture']//..//td[2]
    Should Be Equal    ${actualResult}    ${Picture}
    ${actualResult}=    Get Text    //td[text()='Address']//..//td[2]
    Should Be Equal    ${actualResult}    ${Address}
    ${actualResult}=    Get Text    //td[text()='State and City']//..//td[2]
    Should Be Equal    ${actualResult}    ${State&City}
     Wait Until Page Contains Element  xpath=//button[@id='closeLargeModal']
    Click Element   xpath://button[@id='closeLargeModal']