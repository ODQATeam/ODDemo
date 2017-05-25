*** Settings ***
Library    OperatingSystem
Library    AppiumLibrary
*** Variables ***
${REMOTE_URL}         http://localhost:4723/wd/hub
${device}               HI69L0U8A043MR
#0180509682106615
${KEYCODE_HOME}       3
${phonenum}           01005400481
${search box}         xpath=//*[contains(@resource-id,':id/search_box_collapsed')]
${name}=              كريم
${ODM_package}        com.orange.phone.mea
${ODM_AppActivity}    com.orange.phone.DialtactsActivity
*** Keywords ***
Launch dialer
    Open Application  ${REMOTE_URL}   platformName=Android  deviceName=${device}    udid=${device}    appPackage=${ODM_package}    appActivity=${ODM_AppActivity}    unicodeKeyboard=True

Custome scroll down
    [Arguments]     ${dy}=10
    ${output}=      run     adb -s ${device} shell input swipe 24 682 20 202 100

Close dialer app
    close application

Check For Elements Existance
    [Arguments]  ${locator}
    page should contain element  ${locator}

Check For Elements Existance TwoArg
    [Arguments]  ${locator}   ${swipFlag}
    Run Keyword If  ${swipFlag}== True        Custome scroll down
    page should contain element   ${locator}