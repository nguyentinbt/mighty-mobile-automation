*** Settings ***
Library           AppiumLibrary
Test Teardown     Close Application

*** Variables ***
${REMOTE_URL}     http://127.0.0.1:4723
${PLATFORM}       Android
${DEVICE_NAME}    575a96d
${PACKAGE}        mighty.audio
${ACTIVITY}       com.mightyaudio.messaging.MainActivity

*** Test Cases ***
Launch Mighty Audio App
    Open Application    ${REMOTE_URL}
    ...    platformName=${PLATFORM}
    ...    deviceName=${DEVICE_NAME}
    ...    appPackage=${PACKAGE}
    ...    appActivity=${ACTIVITY}
    ...    automationName=UiAutomator2
    ...    noReset=true
    ...    fullReset=false
    ...    forceAppLaunch=true
    ...    appWaitActivity=com.mightyaudio.*

    Wait Until Page Contains Element    xpath=//*    timeout=15s
    [Teardown]    Close Application
    Sleep    5
    Click Element    xpath=//w2.d1/android.view.View/android.view.View/android.view.View/android.view.View    
    Sleep    5
    Click Element    xpath=//w2.d1/android.view.View/android.view.View/android.view.View/android.view.View[1]/android.view.View[1]/android.view.View