*** Settings ***
Documentation         Verify the google API
Library               RequestsLibrary
Resource              ../resources/resource.robot


*** Test Cases ***
Verify google API
    [Documentation]     This is to test the google API functionality
    Quick Get Request Test
    Quick Get Request With Parameters Test
    Quick Get A JSON Body Test


*** Keywords ***
Quick Get Request Test
    [Documentation]     Use GET to access google.com
    ${response}=    GET  ${URL}

Quick Get Request With Parameters Test
    [Documentation]     Uses GET to search for a query=ciao and expectes a status code of 200
    ${response}=    GET  ${URL}/search  params=${QUERY}  expected_status=${EXPECTED_CODE}

Quick Get A JSON Body Test
    [Documentation]     Uses GET to fetch a JSON response with an ID parameter
    ${response}=    GET  ${RESPONSE_URL}
    Should Be Equal As Strings    1  ${response.json()}[id]
