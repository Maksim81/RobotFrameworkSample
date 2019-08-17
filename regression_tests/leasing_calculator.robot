from selenium import webdriver
*** Settings ***
Documentation     A test suite with a several test cases for SEB leasing calculator
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          resource.robot

*** Test Cases ***
Successful financial leasing calculation
    Open Browser To Leasing Calculator Page
    Leasing Calculator Page Should Be Open
    Accept Cookies
    Select Leasing Calculator Frame
    Input Purchase Value  10000
    Calculate Leasing Result
    Financial Leasing Should Contain All Data
    [Teardown]    Close Browser

Successful operating leasing calculation
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

Leasing calculation Add to comprarision
    Open Browser To Leasing Calculator Page
    Leasing Calculator Page Should Be Open
    Accept Cookies
    Select Leasing Calculator Frame
    Input Purchase Value  10000
    Calculate Leasing Result
    Add Leasing Result To Comparision
    [Teardown]    Close Browser



