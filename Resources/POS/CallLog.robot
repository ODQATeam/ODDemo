*** Settings ***
Library         AppiumLibrary
Library         String
*** Variables ***
${Call_log_page}             xpath=//*[contains(@resource-id,':id/recycler_view')]
${Call_log_entry_names}      xpath=//*[contains(@resource-id,':id/name')]
${Call_log_entry_images}     xpath=//*[contains(@resource-id,':id/quick_contact_photo')]
${Call_log_entry_call}       xpath=//*[contains(@resource-id,':id/primary_action_button')]
${Call_log_delete_entry}     xpath=//*[contains(@resource-id,':id/delete_mode_delete')]
${Call_log_unsecelt}         xpath=//*[contains(@resource-id,':id/delete_mode_select')]
${Dialpad}    xpath=//android.widget.ImageButton
*** Keywords ***
Verify call log loaded
    page should contain element  ${Call_log_page}

Select entry by index
    [Arguments]  ${idx}
    long press  ${Call_log_entry_names}[${idx}]

Select entry by name
    [Arguments]  ${name}
    long press  ${Call_log_entry_names}//*[@text='${name}']

Select entry by image index
    [Arguments]  ${idx}
    long press  ${Call_log_entry_images}[${idx}]


Click entry by image index
    [Arguments]  ${idx}
    click element  ${Call_log_entry_images}[${idx}]


Make a call by index
     [Arguments]  ${idx}
     click element  ${Call_log_entry_call}[${idx}]

Delete selected entry
    click element  ${Call_log_delete_entry}

Get entry name by index
    [Arguments]  ${idx}
    ${name}=    get element attribute   ${Call_log_entry_names}[${idx}]     text
    [Return]  ${name}


Click dialpad button
    click element  ${Dialpad}
