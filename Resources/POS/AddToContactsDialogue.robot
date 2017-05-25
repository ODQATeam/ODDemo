*** Settings ***
Library         AppiumLibrary
*** Variables ***
#outer pannel
${Add_to_contacts_dialouge}         xpath=//android.widget.LinearLayout[@resource-id='android:id/parentPanel']
${Create_new}                       xpath=//android.widget.ListView[@resource-id='android:id/select_dialog_listview']/android.widget.TextView[@index='0']
${Add_to_existing}                  xpath=//android.widget.ListView[@resource-id='android:id/select_dialog_listview']/android.widget.TextView[@index='1']
*** Keywords ***
Verify add to contact dialouge loaded
    page should contain element  ${Add_to_contacts_dialouge}

Create new contact
    click element  ${create_new}


Add to existing contact
    click element  ${add_to_existing}