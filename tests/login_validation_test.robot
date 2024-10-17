*** Settings ***
Documentation       To validate the Login form
Library             SeleniumLibrary
Test Setup          open the browser with the Mortgage payment url
Test Teardown       Close Browser Session
Resource            resource.robot

*** Variables ***
${ERROR_MESSAGE}    css:.alert-danger

*** Test Cases ***
Validate Unsuccessful Login
    Fill the login form
    wait until it checks and display the error message
    verify if error message is correct

*** Keywords ***
 Fill the login form
    [Arguments]          ${username}     ${password}
     Input Text          id:username      ${username}
     Input Password      id:password     ${password}
     Click Button        signInBtn

 wait until it checks and display the error message
    Wait Until Element Is Visible    ${ERROR_MESSAGE}

 verify if error message is correct
   ${result}=   Get Text    ${ERROR_MESSAGE}
   Should Be Equal As Strings    ${result}    Incorrect username/password.
   Element Text Should Be    ${ERROR_MESSAGE}    Incorrect username/password.
