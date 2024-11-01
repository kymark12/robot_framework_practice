*** Settings ***
Documentation         Practice web automation using SeleniumLibrary
Resource              ../resources/resource.robot


*** Test Cases ***
Validate Unsuccessful Login
    [Documentation]     Tests the login validation function
    open a browser to the mortgage payment url
#    fill the login form
#    wait until it checkks and displays an error message
#    verify the error message
