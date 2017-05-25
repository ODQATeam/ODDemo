*** Settings ***
Library         AppiumLibrary
*** Variables ***
# tabs
${App_Home_Lable}      xpath=//android.widget.TextView[@text='Phone' or @text='الهاتف']
${Favorites_tab}       xpath=//android.widget.ImageView[@content-desc='Favorites' or @content-desc='المفضله']
${Call_Log_tab}        xpath=//android.widget.ImageView[@content-desc='Recents' or @content-desc='الأخيره']
#${Contacts_tab}        xpath=//android.widget.ImageView[@text='Contacts' or @text='الأرقام']/../android.widget.FrameLayout
${Contacts_tab}        xpath=//android.widget.ImageView[@content-desc='Contacts' or @content-desc='الأرقام']
${Link_tab}            xpath=//android.widget.ImageView[@content-desc='VAS']
${Myorange_tab}        xpath=//android.widget.ImageView[@content-desc='VAS']
#3 dots menue --> content-desc='More options'
${Options_menu}        xpath=//*[contains(@resource-id,'id/dialtacts_options_menu_button')]
${Search}              xpath=//android.widget.ImageButton[contains(@resource-id,'id/search_magnifying_glass')]
${Dialpad_keys}        xpath=//*[contains(@resource-id,'id/floating_action_button')]

*** Keywords ***
Verify app loaded
    page should contain element  ${App_Home_Lable}

Navigate to favorites
    click element  ${Favorites_tab}

Navigate to call log
    click element  ${Call_Log_tab}

Navigate to contacts
    click element  ${Contacts_tab}

Navigate to my orange
    click element  ${Myorange_tab}

Open options menu
    click element  ${Options_menu}

Launch dialpad
    click element  ${Dialpad_keys}

Search contacts
    click element  ${Search}

