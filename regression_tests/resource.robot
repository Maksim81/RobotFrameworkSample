*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.
Library           Selenium2Library

*** Variables ***
${BROWSER}        Chrome
${DELAY}          0
${VALID PURCHASE VALUE}    10000
${CAR LEASING URL}      https://www.seb.ee/eng/loan-and-leasing/leasing/car-leasing#calculator
${LEASING CALCULATOR URL}    https://www.seb.lv/eng/loan-and-leasing/leasing/leasing-calculator
${CALCULATE}   //button[contains(text(),"Calculate")]
${BUTTON CLICKER}  document.body.getElementsByClassName('btn btn-dark')[0].click()
*** Keywords ***
Accept Cookies
    Click Link    I agree

Open Browser To Car Leasing Page
    Open Browser    ${CAR LEASING URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Car leasing page Should Be Open

Car leasing page Should Be Open
    Location Should Be    ${CAR LEASING URL}
    Title Should Be    Car leasing | SEB

Go To Car leasing page
    Go To    ${CAR LEASING URL}
    Car leasing page Should Be Open

Input Valid Purchase Value
    [Arguments]    ${VALID PURCHASE VALUE}
    Input Text    summa    ${VALID PURCHASE VALUE}

Calculate result
    Execute Javascript   window.document.getElementsByClassName("btn btn-dark")[0].click();

Open Browser To Leasing Calculator Page
    Open Browser    ${LEASING CALCULATOR URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Leasing calculator page Should Be Open

Leasing calculator page Should Be Open
    Location Should Be    ${LEASING CALCULATOR URL}
    Title Should Be    Leasing calculator | SEB banka


