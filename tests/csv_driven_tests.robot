*** Settings ***
Documentation       Run tests using data sets from a csv file
Library             SeleniumLibrary
Library             DataDriver      file=data/data.csv      encoding=utf_8      dialect=unix
Resource            ../resources/resource.robot
Test Setup          open the browser with the Mortgage payment url
Test Template       Validate unsuccessful login
Test Teardown       Close Browser Session

*** Test Cases ***
Login with ${username} and ${password}

*** Keywords ***
Validate unsuccessful login
    [Arguments]             ${username}    ${password}
    Fill the login form     ${username}    ${password}
    Wait until it checks and display the error message
    Verify if error message is correct