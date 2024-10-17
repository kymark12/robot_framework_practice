*** Settings ***
Documentation       Practice multi-window navigation in Robot
Library             SeleniumLibrary
Library             Collections
Test Setup          open the browser with the Mortgage payment url
Test Teardown       Close Browser
Resource            resource.robot

*** Variables ***
${ERROR_MESSAGE_LOGIN}      css:.alert-danger

*** Test Cases ***
Validate the child window functionality
     Select the link of the child window
     Verify the user is switched to the child window
     Grab the email address in the child window
     Switch to parent window and enter the email

*** Keywords ***
Select the link of the child window
    Click Element               css:a[target='_blank']
    Sleep                       3

Verify the user is switched to the child window
    Switch Window               NEW
    Element Text Should Be      css:h1      DOCUMENTS REQUEST

Grab the email address in the child window
    [Documentation]             This gets an email from a description on a new window
    ${text}=                    Get Text                    css:p[class$='red']
    # Splits the descriptiong from the word "at"
    # So it will be 0 = "Please email us "
    # 1 = "mentor@rahulshettyacademy.com with below template to receive response"
    @{words}=                   Split String                ${text}                     at
    ${text_split}=              Get From List               ${words}                    1
    Log                         ${text_split}
    @{words2}=                  Split String                ${text_split}
    ${email}=                   Get From List               ${words2}                   0
    Set Global Variable         ${email}

Switch to parent window and enter the email
    Switch Window               MAIN
    Title Should Be             LoginPage Practise | Rahul Shetty Academy
    Input Text                  id:username                 ${email}
    Sleep                       5
