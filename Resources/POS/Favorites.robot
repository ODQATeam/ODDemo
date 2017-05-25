*** Settings ***
Library         AppiumLibrary
*** Variables ***
${Favorite_page}        xpath=//android.widget.TextView[@text='المفضلة' ]
${Contact_cards}        xpath=//*[contains(@resource-id,':id/contact_tile')]
${Contact_card_names}   xpath=//*[contains(@resource-id,':id/contact_tile_name')]
${Contacts_images}      xpath=//*[contains(@resource-id,':id/contact_tile_image')]
${Repeated_Contacts}    xpath=//android.widget.TextView[@text='اتصالات مكررة']
#${Elgawal_Label}        xpath=//*[contains(@resource-id,':id/frequent_phone_label') and @text='الجوال']
${Elgawal_Label}        xpath=//*[contains(@resource-id,':id/frequent_phone_label') and @text='هاتف محمول']
${Elgawal_text}         xpath=//*[contains(@resource-id,':id/contact_tile_phone_type') and  @text='هاتف محمول']
${Dialpad}              xpath=//android.widget.ImageButton
*** Keywords ***
Verify favorite page loaded
    page should contain element  ${Favorite_page}

Call favorite by name
    [Arguments]  ${name}
    click element  ${contact_card_names}[@text='${name}']/../../android.widget.ImageView

Call favorite by index
    [Arguments]  ${index}
    click element  ${Contacts_images}[${index}]

Open contact page by name
    [Arguments]  ${name}
    click element   xpath=//android.widget.TextView[contains(&text,'${name}')]/../android.widget.RelativeLayout/android.widget.ImageView
    #contains(@resource-id,':id/contact_favorite_card') and
    #${contact_card_names}[@text='${name}']/../android.widget.ImageView

Open contact page by index
    [Arguments]  ${index}
    click element  ${contact_card_names}[index]/../android.widget.ImageView

Click dialpad button
    click element  ${Dialpad}