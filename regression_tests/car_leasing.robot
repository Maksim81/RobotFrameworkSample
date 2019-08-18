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
    Select Car Leasing Frame
    Select Car Operating Lease
    Input Vehicle Price Value  10000
    Input Vehicle Downpayment  20
    Sleep  10s
    [Teardown]    Close Browser

Car Leasing Financial Lease with VAT
    Open Browser To Car Leasing Page
    Car Leasing Page Should Be Open
    Accept Cookies
    Select Car Leasing Frame
    Select Car Financial Lease
    Input Vehicle Price Value  10000
    Input Vehicle Downpayment  15
    [Teardown]    Close Browser

Car Leasing Financial Lease without VAT
    Open Browser To Car Leasing Page
    Car Leasing Page Should Be Open
    Accept Cookies
    Select Car Leasing Frame
    Select Car Financial Lease Without VAT
    Input Vehicle Price Value  10000
    Input Vehicle Downpayment  10
    [Teardown]    Close Browser

Car Leasing Negative Interest Rate
    Open Browser To Car Leasing Page
    Car Leasing Page Should Be Open
    Accept Cookies
    Select Car Leasing Frame
    Input Vehicle Price Value  10000
    Input Vehicle Downpayment  10
    Input Vehicle Leasing Interest  -5
    [Teardown]    Close Browser

Car Leasing Conditions Are Recalculated
    Open Browser To Car Leasing Page
    Car Leasing Page Should Be Open
    Accept Cookies
    Select Car Leasing Frame
    Input Vehicle Price Value  10000
    Input Vehicle Downpayment  10
    Input Vehicle Price Value  20000
    Input Vehicle Downpayment  20
    [Teardown]    Close Browser

Car Leasing Payment Schedule Generated
    Open Browser To Car Leasing Page
    Car Leasing Page Should Be Open
    Accept Cookies
    Select Car Leasing Frame
    Input Vehicle Price Value  10000
    Input Vehicle Downpayment  10
    Display Car Leasing Schedule
    [Teardown]    Close Browser

Car Leasing Add to comparision
    Open Browser To Car Leasing Page
    Car Leasing Page Should Be Open
    Accept Cookies
    Select Car Leasing Frame
    Add Car Leasing Result To Comparision
    [Teardown]    Close Browser

Car Leasing Compare Several Conditions
    Open Browser To Car Leasing Page
    Car Leasing Page Should Be Open
    Accept Cookies
    Select Car Leasing Frame
    Input Vehicle Price Value  10000
    Input Vehicle Downpayment  10
    Add Car Leasing Result To Comparision
    Input Vehicle Price Value  24000
    Input Vehicle Downpayment  21
    Add Car Leasing Result To Comparision
    [Teardown]    Close Browser