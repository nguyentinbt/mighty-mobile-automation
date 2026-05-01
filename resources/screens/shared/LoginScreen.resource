*** Settings ***
Resource    ../android/LoginScreen_Android.resource
Resource    ../ios/LoginScreen_iOS.resource
Library     AppiumLibrary

*** Keywords ***
Enter Username
    [Documentation]    Platform-agnostic keyword — delegates to platform screen
    [Arguments]    ${username}
    Run Keyword If    '${PLATFORM}' == 'Android'
    ...    Enter Username On Android    ${username}
    ...    ELSE
    ...    Enter Username On iOS    ${username}

Enter Password
    [Arguments]    ${password}
    Run Keyword If    '${PLATFORM}' == 'Android'
    ...    Enter Password On Android    ${password}
    ...    ELSE
    ...    Enter Password On iOS    ${password}

Tap Login Button
    Run Keyword If    '${PLATFORM}' == 'Android'
    ...    Tap Login Button On Android
    ...    ELSE
    ...    Tap Login Button On iOS