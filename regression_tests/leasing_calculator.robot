from selenium import webdriver
*** Settings ***
Documentation     A test suite with a several test cases for SEB leasing calculator
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          resource.robot

*** Test Cases ***
Successful Financial leasing calculation
    Open Browser To Leasing Calculator Page
    Leasing Calculator Page Should Be Open
    Accept Cookies
    Select Leasing Calculator Frame
    Input Purchase Value  10000
    Calculate Leasing Result
    Financial Leasing Should Contain All Data
    [Teardown]    Close Browser

Successful Operating Leasing calculation
    Open Browser To Leasing Calculator Page
    Leasing Calculator Page Should Be Open
    Accept Cookies
    Select Leasing Calculator Frame
    Input Purchase Value  10000
    Select From List By Value  f-type  1
    Calculate Leasing Result
    Sleep  1s
    Operating Leasing Should Contain All Data
    [Teardown]    Close Browser

Leasing Calculation Add To Comprarision
    Open Browser To Leasing Calculator Page
    Leasing Calculator Page Should Be Open
    Accept Cookies
    Select Leasing Calculator Frame
    Input Purchase Value  10000
    Calculate Leasing Result
    Add Leasing Result To Comparision
    [Teardown]    Close Browser

Purchase Value Less Than 9000 EUR
    Open Browser To Leasing Calculator Page
    Leasing Calculator Page Should Be Open
    Accept Cookies
    Select Leasing Calculator Frame
    Input Purchase Value  8000
    Calculate Leasing Result
    Consulmer Loan Warning Should Be Displayed
    [Teardown]    Close Browser

Interest rate is 0
    Open Browser To Leasing Calculator Page
    Leasing Calculator Page Should Be Open
    Accept Cookies
    Select Leasing Calculator Frame
    Input Purchase Value  10000
    Input Interest Value  0
    Calculate Leasing Result
    Interest Warning Should Be Displayed
    [Teardown]    Close Browser




