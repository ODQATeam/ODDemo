*** Settings ***
Resource       ../../Resources/Commonutils/basicdialersetups.robot
Resource       ../../Resources/POS/Home.robot
Resource       ../../Resources/POS/Contacts.robot
Resource       ../../Resources/POS/ViewContact.robot
Resource       ../../Resources/POS/ContactDetails.robot
Resource       ../../Resources/POS/Favorites.robot
Resource       ../../Resources/POS/CallLog.robot
Resource       ../../Resources/POS/Dialtacts.robot
Resource       ../../Resources/POS/MyOrange.robot

Test Setup      Launch dialer
Test Teardown   Close dialer app
*** Test Cases ***
Access Dialpad from Recent tab
    [Tags]   demo
   Home.Navigate to call log
   CallLog.Click dialpad button
   Dialtacts.Verify dialpad loaded


Access Dialpad from Favorites tab
    [Tags]   demo
   Home.Navigate to favorites
   Favorites.Click dialpad button
   Dialtacts.Verify dialpad loaded

Access Dialpad from MyOrange tab
    [Tags]   demo
   Home.Navigate to my orange
   MyOrange.Click dialpad button
   Dialtacts.Verify dialpad loaded