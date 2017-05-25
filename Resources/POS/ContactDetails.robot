*** Settings ***
Library         AppiumLibrary
*** Variables ***
${more_button}  xpath=//*[@resource-id ='com.orange.phone.mea:id/call_sheet_title_more_button']
${share}        xpath=//android.widget.TextView[@text='مشاركة']
${share_list}   xpath=//*[@resource-id='android:id/title'  and @text='مشاركة عبر']
#xpath=//android.widget.GridView[@resource-id='android:id/resolver_list']
*** Keywords ***
Click on more options button
   click element  ${more_button}

Click on Share contact button
   click element  ${share}

Verify Share window opened sucessfully
   page should contain element  ${share_list}