*** Settings ***
Library        AppiumLibrary  run_on_failure=Log Source
*** Variables ***
${contact_name}         xpath=(//*[@resource-id='com.android.contacts:id/editors']/android.widget.EditText)[0]
${contact_givenname}    xpath=(//*[@resource-id='com.android.contacts:id/editors']/android.widget.EditText)[1]
${contact_middlename}   xpath=(//*[@resource-id='com.android.contacts:id/editors']/android.widget.EditText)[2]
${contact_familyname}   xpath=(//*[@resource-id='com.android.contacts:id/editors']/android.widget.EditText)[3]
${contact_namesuffix}   xpath=(//*[@resource-id='com.android.contacts:id/editors']/android.widget.EditText)[4]
${contact_phone}        xpath=//*[@resource-id='com.android.contacts:id/phone_numbers']//*[@class ='android.widget.EditText']
${contact_email}        xpath=//*[@resourse-id='com.android.contacts:id/emails']//*[@class='android.widget.EditText']
*** Keywords ***
Enter contact name
        input text  ${contact_name} 'name'
Enter contact given name
        input text  ${contact_givenname} 'name'
Enter contact middle name
        input text  ${contact_middlename} 'name'
Enter contact family name
        input text  ${contact_familyname} 'name'
Enter contact namesuffix
        input text  ${contact_namesuffix} 'name'
Enter contact phone
        input text  ${contact_phone} 'name'
Enter contact email
        input text  ${contact_email} 'name'
