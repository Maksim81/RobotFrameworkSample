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
${PURCHASE VALUE}    10000
${INTEREST VALUE}    5
${VEHICLE PRICE}    10000
${DOWNPAYMENT}      20
${CAR LEASING INTEREST VALUE}    10
${CAR LEASING URL}    https://www.seb.ee/eng/loan-and-leasing/leasing/car-leasing#calculator
${LEASING CALCULATOR URL}    https://www.seb.lv/eng/loan-and-leasing/leasing/leasing-calculator
${CALCULATE}      //button[contains(text(),"Calculate")]
${BUTTON CLICKER}    document.body.getElementsByClassName('btn btn-dark')[0].click()

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

Select Car Leasing Frame
    Select Frame  css=.calculator-frame

Select Car Operating Lease
    Click Element  calc08-type01

Select Car Financial Lease
    Click Element  calc08-type02

Select Car Financial Lease Without VAT
    Click Element  calc08-type03

Add Car Leasing Result To Comparision
    Click Element  css=.a.calc08-action-compare

Display Car Leasing Schedule
    Click Element  value-payment-schedule

Input Vehicle Price Value
    [Arguments]    ${VEHICLE PRICE}
    Input Text    calc08-sum    ${VEHICLE PRICE}

Input Vehicle Downpayment
    [Arguments]    ${DOWNPAYMENT}
    Input Text    calc08-deposit   ${DOWNPAYMENT}

Input Vehicle Leasing Interest
    [Arguments]    ${CAR LEASING INTEREST VALUE}
    Input Text    calc08-int   ${CAR LEASING INTEREST VALUE}

Select Leasing Calculator Frame
    Select Frame  css=.calculator-frame

Input Purchase Value
    [Arguments]    ${PURCHASE VALUE}
    Input Text    f-summa    ${PURCHASE VALUE}

Input Interest Value
    [Arguments]    ${INTEREST VALUE}
    Input Text    f-likme    ${INTEREST VALUE}

Calculate Leasing Result
    Click Button  css=.btn-dark

Add Leasing Result To Comparision
    Click Button  css=.btn.btn-light.js-comparison-add

Display Leasing Schedule
    Click Button  css=.btn.js-show-payment-schedule

Financial Leasing Should Contain All Data
     Element Should Contain  css=.col.col-xs-6.col-sm-8.col-label   Leasing financing amount

Operating Leasing Should Contain All Data

    Element Should Contain  css=.col.col-xs-6.col-sm-8.col-label

Consulmer Loan Warning Should Be Displayed
    Element Should Be Visible   f-summa-error

Interest Warning Should Be Displayed
    Element Should Be Visible   f-likme-error

Calculate Result Javascript
    Execute Javascript    window.document.getElementsByClassName("btn btn-dark")[0].click();

Open Browser To Leasing Calculator Page
    Open Browser    ${LEASING CALCULATOR URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Leasing calculator page Should Be Open

Leasing calculator page Should Be Open
    Location Should Be    ${LEASING CALCULATOR URL}
    Title Should Be    Leasing calculator | SEB banka
