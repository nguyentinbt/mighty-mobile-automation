*** Settings ***
Library    AppiumLibrary

*** Variables ***
# Prioritize AccessibilityId > id > xpath (last resort)
${USERNAME_FIELD}       accessibility_id=usernameInput
${PASSWORD_FIELD}       accessibility_id=passwordInput
${LOGIN_BUTTON}         accessibility_id=loginButton
${ERROR_MESSAGE}        id=com.your.app:id/errorText

*** Keywords ***
Enter Username On Android
    [Arguments]    ${username}
    Wait Until Element Is Visible    ${USERNAME_FIELD}    timeout=10s
    Click Element                    ${USERNAME_FIELD}
    Input Text                       ${USERNAME_FIELD}    ${username}

Enter Password On Android
    [Arguments]    ${password}
    Wait Until Element Is Visible    ${PASSWORD_FIELD}    timeout=10s
    Click Element                    ${PASSWORD_FIELD}
    Input Text                       ${PASSWORD_FIELD}    ${password}

Tap Login Button On Android
    # Wait Until Element Is Enabled    ${LOGIN_BUTTON}    timeout=10s
    Wait Until Element Is Visible    ${LOGIN_BUTTON}    timeout=10s
    Click Element                    ${LOGIN_BUTTON}