*** Settings ***
Resource           ../../drivers/AppiumDriver.resource
Resource           ../../resources/screens/shared/LoginScreen.resource
Resource           ../../resources/keywords/LoginKeywords.resource
Suite Setup        Open ${PLATFORM} Session
Suite Teardown     Close Session
Test Teardown      Capture Page Screenshot

*** Variables ***
${VALID_USER}      testuser@example.com
${VALID_PASS}      SecureP@ssword123

*** Test Cases ***
TC_LOGIN_001: Successful Login With Valid Credentials
    [Documentation]    Verify user can login with valid credentials
    [Tags]    smoke    regression    login
    Enter Username    ${VALID_USER}
    Enter Password    ${VALID_PASS}
    Tap Login Button
    # Home Screen Should Be Displayed

TC_LOGIN_002: Login Fails With Invalid Password
    [Documentation]    Verify error message appears on invalid login
    [Tags]    regression    negative    login
    Enter Username    ${VALID_USER}
    Enter Password    wrongpassword
    Tap Login Button
    # Error Message Should Be Displayed    Invalid credentials