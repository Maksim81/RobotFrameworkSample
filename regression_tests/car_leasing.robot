from selenium import webdriver
*** Settings ***
Documentation     A test suite with a single test for valid login.
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          resource.robot

*** Test Cases ***
Car Leasing Page Alive
    Open Browser To Car Leasing Page
    Car Leasing Page Should Be Open
    Accept Cookies
    [Teardown]    Close Browser

Car Leasing Operational Lease
    Open Browser To Car Leasing Page
    Car Leasing Page Should Be Open
    Accept Cookies
    [Teardown]    Close Browser
