*** Settings ***
Documentation   A resource file with reusable keywords and varibales.
...
...             The system specific keywords created here form our own
...             domain specific language. They utilize keywords provided
...             by the imported SeleniumLibrary
Library         SeleniumLibrary
Library         String
Library         Collections
Library         utils.py


*** Variables ***
${LOGIN URL}                https://rahulshettyacademy.com/loginpagePractise/
${BROWSER}                  Chrome
${VALID_USERNAME}           rahulshettyacademy
${VALID_PWD}                learning
${INVALID_USER_NAME}        test@test.com
${INVALID_PASSWORD}         12314124
${ERROR_MESSAGE}            css:.alert-danger

*** Keywords ***
Open the browser with the Mortgage payment url
    Open Browser         ${LOGIN URL}    ${BROWSER}
    Maximize Browser Window
    Title Should Be      LoginPage Practise | Rahul Shetty Academy

Fill the login form
    [Arguments]          ${username}     ${password}
     Input Text          id:username     ${username}
     Input Password      id:password     ${password}
     Click Button        signInBtn
     
Wait until the element is visible on the page
    [Arguments]     ${element}
    Wait Until Element Is Visible    ${element}

Wait until it checks and display the error message
    Wait Until Element Is Visible    ${ERROR_MESSAGE}

Verify if error message is correct
   ${result}=                           Get Text            ${ERROR_MESSAGE}
   Should Be Equal As Strings           ${result}           Incorrect username/password.
   Element Text Should Be               ${ERROR_MESSAGE}    Incorrect username/password.

Close Browser Session
   Close Browser