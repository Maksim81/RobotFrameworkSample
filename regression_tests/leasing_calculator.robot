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
    Calculate result
    Sleep   5s
    [Teardown]    Close Browser



