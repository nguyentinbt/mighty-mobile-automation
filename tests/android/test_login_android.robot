*** Settings ***
Library           AppiumLibrary
Resource    ../resources/screens/common/BaseScreen.resource
Resource    ../resources/screens/android/LoginScreen_Android.resource
#Test Teardown     Close Application

*** Variables ***
${VALID_USERNAME}        plnvy.27997
${VALID_PASSWORD}        Mighty@1
${INVALID_USERNAME}    plnv.2709
${INVALID_PASSWORD}    mighty@1
${ERROR_MESSAGE}    Username and password do not match

*** Test Cases ***
Login Fail With Invalid Username
    [Documentation]    Verify unsuccessful login with incorrect username and correct password.
    Launch Mighty Audio App
    Tap on Arrow button on Onboarding page
    Sleep    2
    Tap on Arrow button on Plug in Mighty page
    Sleep    2
    Is in Sign in page
    Sleep    2
    Input Username    ${INVALID_USERNAME}
    Input Password    ${VALID_PASSWORD}
    Tap on Unhide button
    Sleep    5
    Tap on Sign in button
    Sleep    5
    Verify Error Message Displayed    ${ERROR_MESSAGE}    
    Close Application

Login Fail With Invalid Password
    [Documentation]    Verify unsuccessful login with correct username and incorrect password.
    Launch Mighty Audio App
    Tap on Arrow button on Onboarding page
    Sleep    2
    Tap on Arrow button on Plug in Mighty page
    Sleep    2
    Is in Sign in page
    Sleep    2
    Input Username    ${VALID_USERNAME}
    Input Password    ${INVALID_PASSWORD}
    Tap on Unhide button
    Sleep    5
    Tap on Sign in button
    Sleep    5
    Verify Error Message Displayed    ${ERROR_MESSAGE}    
    Close Application

Cannot Login Without Input Credentials   
    [Documentation]    Verify validation when leaving fields blank.
    Launch Mighty Audio App
    Tap on Arrow button on Onboarding page
    Sleep    2
    Tap on Arrow button on Plug in Mighty page
    Sleep    2
    Is in Sign in page
    Sleep    2 
    Verify Sign in Button is not clickabled  
    Close Application
    
Login Successfully With Valid Credentials
    [Documentation]    Verify successful login with correct username and password.
    Launch Mighty Audio App
    Tap on Arrow button on Onboarding page
    Sleep    2
    Tap on Arrow button on Plug in Mighty page
    Sleep    2
    Is in Sign in page
    Sleep    2
    Input Username    ${VALID_USERNAME}
    Input Password    ${VALID_PASSWORD}
    Tap on Unhide button
    Sleep    5
    Tap on Sign in button
    Sleep    5
    Verify Login Success
    Close Application