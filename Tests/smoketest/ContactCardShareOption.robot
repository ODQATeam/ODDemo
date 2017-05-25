*** Settings ***
Resource       ../../Resources/Commonutils/basicdialersetups.robot
Resource       ../../Resources/POS/Home.robot
Resource       ../../Resources/POS/Contacts.robot
Resource       ../../Resources/POS/ViewContact.robot
Resource       ../../Resources/POS/ContactDetails.robot
Resource       ../../Resources/POS/Favorites.robot
Resource       ../../Resources/POS/CallLog.robot

Test Setup      Launch dialer
Test Teardown   Close dialer app
*** Test Cases ***
Check share window from Contacts tab
    #[Tags]  Share    Core   smoke  demo
    Navigate to contacts
    sleep  1s
    Contacts.Select contact by name    هند
    ViewContact.Verify contact page loaded
    ContactDetails.Click on more options button
    ContactDetails.Click on Share contact button
    sleep  15s
    ContactDetails.Verify Share window opened sucessfully


Check share window from Favorites tab
    #[Tags]  Share    Core   smoke   debugit
    Navigate to favorites
    sleep  1s
    Favorites.Open contact page by name    سها
    sleep  10s
    ContactDetails.Click on more options button
    ContactDetails.Click on Share contact button
    sleep  15s
    ContactDetails.Verify Share window opened sucessfully

Check share window from recent tab
    #[Tags]  Share    Core   smoke   demo
    Navigate to call log
    sleep  1s
    CallLog.Click entry by image index   1
    sleep  10s
    ContactDetails.Click on more options button
    ContactDetails.Click on Share contact button
    sleep  15s
    ContactDetails.Verify Share window opened sucessfully
