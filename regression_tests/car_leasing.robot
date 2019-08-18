from selenium import webdriver
*** Settings ***
Documentation     A test suite with a several test cases for Car leasing calculator
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          resource.robot

*** Test Cases ***

Car Leasing Operational Lease
    Open Browser To Car Leasing Page
    Car Leasing Page Should Be Open
    Accept Cookies
    Select Leasing Calculator Frame
    [Teardown]    Close Browser

Car Leasing Financial Lease with VAT
    Open Browser To Car Leasing Page
    Car Leasing Page Should Be Open
    Accept Cookies
    Select Leasing Calculator Frame
    [Teardown]    Close Browser

Car Leasing Financial Lease without VAT
    Open Browser To Car Leasing Page
    Car Leasing Page Should Be Open
    Accept Cookies
    Select Leasing Calculator Frame
    [Teardown]    Close Browser

Car Leasing Negative interest rate
    Open Browser To Car Leasing Page
    Car Leasing Page Should Be Open
    Accept Cookies
    Select Leasing Calculator Frame
    [Teardown]    Close Browser

Car Leasing Conditions are recalculated
    Open Browser To Car Leasing Page
    Car Leasing Page Should Be Open
    Accept Cookies
    Select Leasing Calculator Frame
    Input Vehicle Price Value  10000
    [Teardown]    Close Browser

Car Leasing Payment Schedule Generated
    Open Browser To Car Leasing Page
    Car Leasing Page Should Be Open
    Accept Cookies
    Select Leasing Calculator Frame
    Display Car Leasing Schedule
    [Teardown]    Close Browser

Car Leasing Add to comparision
    Open Browser To Car Leasing Page
    Car Leasing Page Should Be Open
    Accept Cookies
    Select Leasing Calculator Frame
    Add Car Leasing Result To Comparision
    [Teardown]    Close Browser