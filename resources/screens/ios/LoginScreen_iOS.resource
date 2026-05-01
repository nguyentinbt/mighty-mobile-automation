*** Settings ***
Library    AppiumLibrary

*** Variables ***
${USERNAME_FIELD}       accessibility_id=usernameInput
${PASSWORD_FIELD}       accessibility_id=passwordInput
${LOGIN_BUTTON}         accessibility_id=loginButton
${ERROR_MESSAGE}        xpath=//XCUIElementTypeStaticText[@name='errorMessage']

*** Keywords ***
Enter Username On iOS
    [Arguments]    ${username}
    Wait Until Element Is Visible    ${USERNAME_FIELD}    timeout=15s
    Clear Text                       ${USERNAME_FIELD}
    Input Text                       ${USERNAME_FIELD}    ${username}

Enter Password On iOS
    [Arguments]    ${password}
    Wait Until Element Is Visible    ${PASSWORD_FIELD}    timeout=15s
    Input Text                       ${PASSWORD_FIELD}    ${password}

Tap Login Button On iOS
    # Wait Until Element Is Enabled    ${LOGIN_BUTTON}    timeout=15s
    Wait until element is visible    ${LOGIN_BUTTON}    timeout=15s
    Click Element                    ${LOGIN_BUTTON}
    # Dismiss keyboard if present
    Hide Keyboard