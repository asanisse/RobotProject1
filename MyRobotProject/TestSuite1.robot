*** Settings ***
Library    SeleniumLibrary   

Suite Setup       Log      I am inside Test Suite Setup
Suite Teardown    Log      I am inside Test Suite Teardown
Test Setup        Log      I am inside Test Setup
Test Teardown     Log      I am inside Test Teardown

Default Tags    sanity

*** Test Cases ***

MyFirstTest
    [Tags]    smoke
    Log    Hello Word...
    
MySecondTest
    [Tags]    example
    Log    I am inside 2nd test
    Set Tags         Regression1
    Remove Tags      Regression1
    
MyThirdTest
    Log    I am inside 3rd test
            
    
FirstSeleniumTest
  # Create Webdriver    Chrome    executable path=C:\Python\Scripts
  #Create Webdriver    Chrome    ${EXECDIR}C:\Python\Scripts
    Open Browser    https://google.com    chrome  
    Set Browser Implicit Wait    5
    Input Text      name=q                Automation step by step
    Press Keys    name=q     ENTER
    #Click Button    name=btnK     
    Sleep    2    
    Close Browser          
    Log    Test completed
    
SampleLoginTest
    [Documentation]    This is a sample login test
    Open Browser    ${URL}      chrome
    Set Browser Implicit Wait    5
    LoginKW
    #Input Text      id=txtUsername    @{CREDENTIALS}[0]
    #Input Text      id=txtPassword    &{LOGINDATA}[password]
    #Click Button    id=btnLogin    
    Click Element   id=welcome
    Click Element   link=Logout  
    Close Browser
    Log             Test completed  
    Log             This test was executed by %{username} on %{os} 
    #%{username} and %{os} are environmental variables and can be found in command prompt by entering echo %username% 
    
*** Variables ***
${URL}     https://opensource-demo.orangehrmlive.com/       #SCALAR variable
@{CREDENTIALS}    Admin    admin123                         #LIST variable
&{LOGINDATA}    username=Admin    password=admin123         #DICTIONARY variable

*** Keywords ***
LoginKW 
    Input Text      id=txtUsername    @{CREDENTIALS}[0]
    Input Text      id=txtPassword    &{LOGINDATA}[password]
    Click Button    id=btnLogin    