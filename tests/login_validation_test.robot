*** Settings ***
Documentation       To validate the Login form
Library             SeleniumLibrary
Test Setup          open the browser with the Mortgage payment url
Test Teardown       Close Browser Session
Resource            ../resources/resource.robot

*** Variables ***
# Error message selector
${ERROR_MESSAGE}        css=.alert-danger
${NEXT_PAGE_HEADER}     xpath=//a[.='ProtoCommerce']

*** Test Cases ***
Validate Unsuccessful Login
    Fill the login form
    wait until it checks and display the error message
    verify if error message is correct
    
Verify successful login
     Fill the login form                ${VALID_USERNAME}       ${VALID_PWD}
     Wait Until Element Is Visible      ${NEXT_PAGE_HEADER}     timeout=60s
     ${header_title}=       Get Text                ${NEXT_PAGE_HEADER}
     Should Be Equal        ${header_title}         ProtoCommerce

*** Keywords ***
 Fill the login form
    [Arguments]         ${username}     ${password}
    Input Text          id:username     ${username}
    Input Password      id:password     ${password}
    Click Button        signInBtn

 wait until it checks and display the error message
    Wait Until Element Is Visible    ${ERROR_MESSAGE}

 verify if error message is correct
   ${result}=                       Get Text            ${ERROR_MESSAGE}
   Should Be Equal As Strings       ${result}           Incorrect username/password.
   Element Text Should Be           ${ERROR_MESSAGE}    Incorrect username/password.
