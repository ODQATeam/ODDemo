*** Settings ***
Library        AppiumLibrary  run_on_failure=Log Source
Library        OperatingSystem
Library        String
Library        Collections
Resource       ../Resources/Commonutils/basicdialersetups.robot
Resource       ../Resources/POS/Home.robot
Resource       ../Resources/POS/Contacts.robot
Resource       ../Resources/POS/Dialtacts.robot
Resource       ../Resources/POS/Favorites.robot
Resource       ../Resources/POS/ViewContact.robot
Resource       ../Resources/POS/CallLog.robot

Test Setup      Launch dialer
Test Teardown   Close dialer app
*** Variables ***
#${REMOTE_URL}        http://127.0.0.2:3456/wd/hub
${device}             01994096A3000842
${KEYCODE_HOME}       3
${phonenum}           01005400481
#${contacts_tab}       xpath=//*[@text='الهاتف']
${contacts}			  xpath=//*[@content-desc='الأرقام']
#${contact_name}       xpath=//*[contains(@class,'android.widget.TextView') and contains (@name,'Adan Singh')]
#${favorite}           xpath=//*[contains(@id, ':id/call_sheet_title_favorite_button')]
#${dial up digit}         xpath=//*[@text='${ELEMENT}' and contains(@resource-id,':id/dialpad_key_number')]
${keys}     01005400481
*** Test Cases ***
Env Smoke Test
    #Launch Dialer
    Click Element    ${contacts_tab}
    Click Element    ${contacts}
    Click Element    xpath=//*[@class='android.widget.ImageView'][@content-desc='Favorites' or @content-desc='المفضله']

Test home kwds
    [Tags]  home
    given navigate to call log
    when launch dialpad
    And dial a phone number  01005400481
    And dial the number
    then wait until page contains element  xpath=//*[contains(@resource-id,'dialpad_container')]

Test get digit
    [Tags]  Dialtacts
    ${rslt}     get digit locator  1
    log to console  ${rslt}

Test construct phone locators
    [Tags]  test1
    @{ITEMS}=        Split String To Characters    ${keys}
        :FOR    ${ELEMENT}    IN    @{ITEMS}
        \        ${locator}     Get digit locator       ${Element}
        \        Sleep    1s
        \        Log To Console    ${locator}

Test dial new number the add new should appear
    [Tags]  dialtoadd
    given navigate to call log
    when launch dialpad
    And dial a phone number  010054003
    then Add to contacts visible

Test dial from favorite
    [Tags]  done
    navigate to favorites
    verify favorite page loaded
    call favorite by name  Orangetest
    #Click element  xpath=//android.widget.TextView[@text='Orangetest']
    #call favorite by index  1
    #click element  xpath=//*[contains(@resource-id,':id/contact_tile_image')][1]
    sleep  10s

Test open favorite contact page
    [Tags]  postponed
    navigate to favorites
    Favorites.verify favorite page loaded
    #call favorite by name  Orangetest
    #Click element  xpath=//android.widget.TextView[@text='Orangetest']
    #call favorite by index  1
    #click element  xpath=//*[contains(@resource-id,':id/contact_tile_image')][1]
    ${name}  set variable  Orangetest
    #click element  //*[@text='${name}']/../android.widget.RelativeLayout
    @{elms}     get elements  xpath=//*[contains(@resource-id,':id/contact_tile_secondary_button')]
    #xpath=//android.widget.ImageView[@content-desc='عرض جهة الاتصال']
    log list  ${elms}
    ${elm}  get from list  ${elms}  1
    ${location}     get element location  xpath=(//*[contains(@resource-id,':id/contact_tile_secondary_button')])[2]
    ${x}        get from dictionary  ${location}    x
    ${y}        get from dictionary  ${location}    y
    ${x}        evaluate  ${x}+2
    ${y}        evaluate  ${y}+2
    sleep  1s
    long press  ${elm}
    #click element at coordinates  ${x}  ${y}
    #click element at coordinates  165  271
    #click a point  167  273
    sleep  10s

Add a favorite from contacts
    [Tags]  Favorits    Core
    Navigate to contacts
    sleep  1s
    Contacts.Select contact by name    Mahmoud
    ViewContact.Verify contact page loaded
    ViewContact.Toggle favorite flage

Delete call event from long press
    [Tags]  CallLog    Core    debugit
    Navigate to call log
    CallLog.Verify call log loaded
    CallLog.Select entry by index  1
    CallLog.Delete selected entry

Print 1st entry name in call log
    [Tags]  CallLog    Core    debugit
    Navigate to call log
    CallLog.Verify call log loaded
    ${abc}=     Get entry name by index  1
    log to console  ${abc}