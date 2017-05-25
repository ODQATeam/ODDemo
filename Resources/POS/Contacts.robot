*** Settings ***
Library         AppiumLibrary
*** Variables ***
${Contacts_list}        xpath=//*[@resource-id='android:id/list']/android.view.ViewGroup/*
${Contacs_names}        xpath=//*[@resource-id='android:id/list']/android.view.ViewGroup[1]/android.widget.TextView[1]
*** Keywords ***
Get contacts names
    [Return]  get elements  ${Contacs_names}

Select contact by index
    [Arguments]  ${idx}
     click element   ${Contacts_list}[${idx}]

Select contact by name
     [Arguments]  ${name}
     click element  ${Contacts_list}[@text='${name}']