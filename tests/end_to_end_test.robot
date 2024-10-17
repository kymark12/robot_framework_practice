*** Settings ***
Documentation       Test the end-to-end flow of the app
Library             SeleniumLibrary
Library             Collections
Test Setup          open the browser with the Mortgage payment url
Test Teardown       Close Browser Session
Resource            resource.robot

*** Test Cases ***
Validate the cards displayed in the shopping page
      Fill the login form                               ${VALID_USERNAME}    ${VALID_PWD}
      Wait until the element is visible on the page    css:.nav-link
      Verify card titles in the shop page
      Select an item                                    Blackberry


Select the form and navigate to the child window
    [Tags]  replay
    Fill the login details and select the User option

*** Keywords ***
Verify card titles in the shop page
    @{expected_list} =      Create List     iphone X    Samsung Note 8      Nokia Edge      Blackberry
    ${elements} =           Get WebElements   css:.card-title
    @{actual_list} =        Create List
    FOR    ${element}    IN    @{elements}
        Log    ${element.text}
        Append To List      ${actual_list}      ${element.text}
    END
    Lists Should Be Equal    ${expected_list}    ${actual_list}

Select an item
    [Arguments]     ${item_name}
    ${elements} =   Get WebElements   css:.card-title
    ${count} =      Set Variable    1
    FOR    ${element}    IN    @{elements}
        Exit For Loop If    '${item_name}' == '${element.text}'
        ${count}=   Evaluate  ${count} + 1
    END
    Click Button    xpath:(//*[@class='card-footer'])[${count}]/button

Fill the login details and select the User option
     Input Text                             id:username                     ${VALID_USERNAME}
     Input Password                         id:password                     ${VALID_PWD}
     Click Element                          css:input[value='user']
     Wait Until Element Is Visible          css:.btn-success
     Click Button                           css:.btn-success
     Wait Until Element Is Not Visible      css:.modal-body
     Select From List By Value              css:select.form-control         teach
     Select Checkbox                        id:terms
     Checkbox Should Be Selected            id:terms