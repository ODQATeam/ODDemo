*** Settings ***
Library         AppiumLibrary
Library        String

*** Variables ***
${Dial_pad_view}            xpath=//android.widget.LinearLayout[contains(@resource-id,':id/dialpad_view')]
#${digit}                   xpath=//android.widget.TextView[@text='']
${Entered_digits}           xpath=//android.widget.EditText[contains(@resource-id,':id/digits')]
${Delete_digits}            xpath=//android.widget.ImageButton[contains(@resource-id,'id/deleteButton')]
${Search_list_names}        xpath=//android.widget.ListView/android.widget.RelativeLayout/*[contains(@resource-id,'id/search_contact_name')]
${Search_list_phones}       xpath=//android.widget.ListView/android.widget.RelativeLayout/*[contains(@resource-id,'id/search_contact_number')]
${Dial_btn}                 xpath=//*[contains(@resource-id,'id/dialpad_floating_action_button')]
${Add_to_contacts}          xpath=//android.widget.LinearLayout[contains(@resource-id,'search_add_contact_item')]/android.widget.ImageView
*** Keywords ***
Verify dialpad loaded
    page should contain element  ${dial_pad_view}

Get digit locator
    [Arguments]     ${digit_txt}
    ${digit}    set variable    xpath=//android.widget.TableLayout//android.widget.TextView[@text='${digit_txt}']
    [Return]  ${digit}

Dial the number
    click element  ${Dial_btn}

Get search name
    [Arguments]  ${index}
    ${name}     get element attribute  ${Search_list_names}[${index}]   text
    [Return]  ${name}

Get search phone
    [Arguments]  ${index}
    ${phone}     get element attribute  ${Search_list_phones}[${index}]   text
    [Return]  ${phone}

Check search list existance
    ${contacts_list}     get elements  ${Search_list_names}
    ${contacts_list_len}     get length  ${contacts_list}
    [Return]  ${contacts_list_len}

Dial a phone number
    [Arguments]  ${phone}
    @{ITEMS}=        Split String To Characters    ${phone}
            :FOR    ${ELEMENT}    IN    @{ITEMS}
            \       ${locator}    Get digit locator       ${Element}
            \       Sleep    1s
            \       Log To Console    ${locator}
            \       click element     ${locator}

Add to contacts visible
    page should contain element  ${Add_to_contacts}