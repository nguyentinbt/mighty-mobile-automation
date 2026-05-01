*** Settings ***
Library    AppiumLibrary
Library    OperatingSystem
Library    Collections

*** Variables ***
${APPIUM_URL}    http://127.0.0.1:4723

*** Keywords ***
Open Android Session
    [Documentation]    Initializes Appium session for Android real device
    ${caps}=    Load Android Capabilities
    Open Application    ${APPIUM_URL}    &{caps}

Open iOS Session
    [Documentation]    Initializes Appium session for iOS real device
    ${caps}=    Load iOS Capabilities
    Open Application    ${APPIUM_URL}    &{caps}

Load Android Capabilities
    [Documentation]    Reads Android caps from YAML config
    ${caps}=    Evaluate    
    ...    __import__('yaml').safe_load(open('config/android_caps.yaml'))
    ...    modules=yaml
    [Return]    ${caps}

Load iOS Capabilities
    [Documentation]    Reads iOS caps from YAML config
    ${caps}=    Evaluate    
    ...    __import__('yaml').safe_load(open('config/ios_caps.yaml'))
    ...    modules=yaml
    [Return]    ${caps}

Close Session
    [Documentation]    Terminates Appium session gracefully
    Close Application