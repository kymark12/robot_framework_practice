*** Settings ***
Documentation       To validate the Login form
Library             SeleniumLibrary
Resource            ../resources/resource.robot
Test Setup          open the browser with the Mortgage payment url
Test Template       Validate unsuccessful login
Test Teardown       Close Browser Session

*** Test Cases ***          username        password
Invalid username            dsahed          learning
Invalid password            rahulshetty     ploudfg
Special characters          @$@             learning

*** Keywords ***
Validate unsuccessful login
    [Arguments]             ${username}    ${password}
    Fill the login form     ${username}    ${password}
    Wait until it checks and display the error message
    Verify if error message is correct