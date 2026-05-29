*** Settings ***
Library           AppiumLibrary

*** Variables ***
${REMOTE_URL}     http://127.0.0.1:4723
${PLATFORM}       Android
${DEVICE_NAME}    R7AL206HD0D        # Your device ID from adb devices

*** Test Cases ***
Open Settings On Real Device
    Open Application    ${REMOTE_URL}
    ...    platformName=${PLATFORM}
    ...    deviceName=${DEVICE_NAME}
    ...    appPackage=com.android.settings
    ...    appActivity=.Settings
    ...    automationName=UiAutomator2
    ...    noReset=true

    Wait Until Page Contains Element    xpath=//*    timeout=10s
    Capture Page Screenshot
    [Teardown]    Close Application