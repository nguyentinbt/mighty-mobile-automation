*** Settings ***
Library    AppiumLibrary

*** Variables ***
# Prioritize AccessibilityId > id > xpath (last resort)
${ONBOARDING_ARROW_BUTTON}    xpath=//qu0/android.view.View/android.view.View/android.view.View/android.view.View
${PLUGIN_ARROW_BUTTON}    xpath=//qu0/android.view.View/android.view.View/android.view.View/android.view.View[1]/android.view.View[1]/android.view.View
${SIGNIN_TITLE}    Sign in to your Mighty Account
${USERNAME_FIELD}    xpath=//android.widget.ScrollView/android.widget.EditText[1]
${PASSWORD_FIELD}    xpath=//android.widget.ScrollView/android.widget.EditText[2]
${UNHIDE_BUTTON}    xpath=//android.widget.ScrollView/android.widget.EditText[2]/android.view.View/android.view.View[2]
${SIGNIN_BUTTON}    xpath=//android.widget.ScrollView/android.view.View[1]/android.widget.Button
${MESSAGE}    xpath=//android.widget.TextView[@text="Username and password do not match"]
${MUSICSERVICE_TITLE}    Connect to a streaming service
${FORGOTPASS_BUTTON}    xpath=//android.widget.TextView[@text="Forgot Password"]
${LOGIN_FACEBOOK_BUTTON}    xpath=//android.widget.ScrollView/android.view.View[2]/android.widget.Button
${CREATE_ACCOUNT_BUTTON}    xpath=//android.widget.TextView[@text="Create an Account"]
${BACK_BUTTON}    xpath=//qu0/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View

*** Keywords ***
Tap on Arrow button on Onboarding page
    Click Element    ${ONBOARDING_ARROW_BUTTON}

Tap on Arrow button on Plug in Mighty page
    Click Element    ${PLUGIN_ARROW_BUTTON}

Is in Sign in page
    Page Should Contain Text    ${SIGNIN_TITLE}

Input Username
    [Arguments]    ${USERNAME}
    #Wait Until Element Is Visible    ${USERNAME_FIELD}    timeout=5s
    Click Element    ${USERNAME_FIELD}
    Input Text  ${USERNAME_FIELD}    ${USERNAME}
    
Input Password
    [Arguments]    ${PASSWORD}
    Wait Until Element Is Visible    ${PASSWORD_FIELD}    timeout=5s
    Click Element    ${PASSWORD_FIELD}
    Input Text    ${PASSWORD_FIELD}    ${PASSWORD}

Tap on Unhide button
    Click Element    ${UNHIDE_BUTTON}

Tap on Sign in button
     # Wait Until Element Is Enabled    ${SIGNIN_BUTTON}    timeout=10s
    Wait Until Element Is Visible    ${SIGNIN_BUTTON}    timeout=5s
    Click Element    ${SIGNIN_BUTTON}

Verify Login Success
    Page Should Contain Text    ${MUSICSERVICE_TITLE}       

Verify Error Message Displayed
    [Arguments]    ${ERROR_MESSAGE}
    Wait Until Element Is Visible    ${MESSAGE}    timeout=5s
    Element Text Should Be    ${MESSAGE}    ${ERROR_MESSAGE}     

Verify Sign in Button is not clickabled
    #[Arguments]    ${SIGNIN_BUTTON}
    Element Attribute Should Match    ${SIGNIN_BUTTON}    clickable    False

Tap on Forgot Password
    Click Element    ${FORGOTPASS_BUTTON}

Tap on Login with Facebook
    Click Element    ${LOGIN_FACEBOOK_BUTTON}

Tap on Create an Account
    Click Element    ${CREATE_ACCOUNT_BUTTON}

Tap on Back button
    Click Element    ${BACK_BUTTON}

