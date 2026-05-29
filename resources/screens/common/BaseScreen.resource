*** Settings ***
Library           AppiumLibrary

*** Variables ***
${REMOTE_URL}     http://127.0.0.1:4723
${PLATFORM}       Android
${DEVICE_NAME}    R7AL206HD0D
${PACKAGE}        mighty.audio
${ACTIVITY}       com.mightyaudio.messaging.MainActivity

*** Keywords ***
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