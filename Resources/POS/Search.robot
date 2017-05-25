*** Settings ***
Library         AppiumLibrary
*** Variables ***
# xpath = classpath[@IdentificationAttributeName='IdentificationAttributeValue']
${search_button}   xpath=//android.widget.ImageView[contains(@resource-id,'com.orange.phone.mea:id/search_magnifying_glass')]

${search_text}  xpath=//android.widget.EditText[contains(@resource-id,'com.orange.phone.mea:id/search_view')]

*** Keywords ***
search by name already exist
    [Arguments]  ${name}
    click element  ${search_button}
    click element  ${search_text}
    Input Text  ${search_text}  ${name}
    #[@inputText='$name']
    #[@text='${name}']
    page should contain text  ${name}
    clear text  ${search_text}

search by number already exist
    [Arguments]  ${phone_num}
    #click element  ${search_button}
    click element  ${search_text}
    Input Text  ${search_text}  ${phone_num}
    page should contain text  ${phone_num}
    clear text  ${search_text}

search by name doesn't exist
    [Arguments]  ${notExistName}    ${searchMessage}
    click element  ${search_text}
    Input Text  ${search_text}  ${notExistName}
    Sleep  10ms
    page should contain text  ${searchMessage}
    clear text  ${search_text}

search by number doesn't exist
    [Arguments]   ${NotExistPhone_num}  ${searchMessage}
    click element  ${search_text}
    Input Text  ${search_text}  ${NotExistPhone_num}
    Sleep  10ms
    page should contain text  ${searchMessage}