*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.
Library           SeleniumLibrary

*** Variables ***
${BROWSER}        Firefox
${DELAY}          0
${VALID USER}     demo
${VALID PASSWORD}    mode
${CAR LEASING URL}      https://www.seb.ee/eng/loan-and-leasing/leasing/car-leasing#calculator
${LEASING CALCULATOR URL}    https://www.seb.lv/eng/loan-and-leasing/leasing/leasing-calculator

*** Keywords ***
Open Browser To Car Leasing Page
    Open Browser    ${CAR LEASING URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Car leasing page Should Be Open

Go To Car leasing page
    Go To    ${CAR LEASING URL}
    Car leasing page Should Be Open

Input Username
    [Arguments]    ${username}
    Input Text    username_field    ${username}

Input Password
    [Arguments]    ${password}
    Input Text    password_field    ${password}

Submit Credentials
    Click Button    login_button

Accept Cookies
    Click Link    I agree

Car leasing page Should Be Open
    Location Should Be    ${CAR LEASING URL}
    Title Should Be    Car leasing | SEB
