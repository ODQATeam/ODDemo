*** Settings ***
Library    OperatingSystem
 
*** Keywords ***
make an adb call
    [Arguments]    ${udid}    ${telephone}
    ${output}=      run     adb -s ${udid} shell am start -a android.intent.action.CALL -d tel:${telephone}
 
key wrd 2
    Log To Console    \nHello doaa    
    
Send SMS through dialer
    [Arguments]   ${telephone}    ${SMSBody}
    run    adb shell am start -a android.intent.action.SENDTO -d sms:${telephone} --es sms_body ${SMSBody} --ez exit_on_sent true
    run    adb shell input keyevent 22
    run    adb shell input keyevent 66

#pre-condition 2 devices are connected caller and receiver
Accept comming call using dialer
    [Arguments]    ${callerUDID}    ${receiverUDID}    ${receiverTelephone}
    run     adb -s ${callerUDID} shell am start -a android.intent.action.CALL -d tel:${receiverTelephone}
    #${output}=    call exist     ${receiverUDID}
    #Wait Until Keyword Succeeds    2sec    2sec    call exist    ${receiverUDID} 
    Sleep    7s   
    run    adb -s ${receiverUDID} shell input keyevent 5 
    #Run Keyword If     '${output}'=='None'    run     adb -s ${receiverUDID} shell input keyevent 5
    
#pre-condition 2 devices are connected 
Reject coming call using dialer
    [Documentation]    Do some thing.
    [Arguments]    ${callerUDID}    ${receiverUDID}    ${receiverTelephone}
    run     adb -s ${callerUDID} shell am start -a android.intent.action.CALL -d tel:${receiverTelephone}
    Sleep    7s   
    run     adb -s ${receiverUDID} shell input keyevent 6

call exist
    [Arguments]    ${udid}
    ${output}=    run    adb -s ${udid} shell dumpsys telephony.registry | findstr "mCallState"
#Accept comming call using dialer
#   [Arguments]    ${udid}
#    run    adb -s ${udid} shell input keyevent 5

#Reject coming call using dialer
#    [Arguments]    ${udid}
#    run    adb -s ${udid} shell input keyevent 6
    
#pre-condition 2 devices are connected   
