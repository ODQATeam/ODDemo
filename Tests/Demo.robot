*** Settings ***
Resource       ../Resources/Commonutils/basicdialersetups.robot
Resource       ../Resources/POS/Home.robot
Resource       ../Resources/POS/Contacts.robot
Resource       ../Resources/POS/ViewContact.robot
Resource       ../Resources/POS/CallLog.robot
Resource       ../Resources/POS/Favorites.robot
Resource       ../Resources/POS/MyOrange.robot

Test Setup      Launch dialer
Test Teardown   Close dialer app
*** Keywords ***
Check For Elements Existance
    [Arguments]  ${locator}
    page should contain element  ${locator}
#    scroll up     ${locator}

Open my orange page
    Launch dialer
    Navigate to my orange
*** Test Cases ***
Add a favorite from contacts
    [Tags]  Favorits    Core
    Navigate to contacts
    sleep  1s
    Contacts.Select contact by name    Mahmoud
    ViewContact.Verify contact page loaded
    ViewContact.Toggle favorite flage

Delete call event from long press
    [Tags]  CallLog    Core
    Navigate to call log
    CallLog.Verify call log loaded
    CallLog.Select entry by index  1
    CallLog.Delete selected entry

Test Contacts page
    [Tags]  debugit
    Navigate to contacts
    @{names_list}   Contacts.Get contacts names
    log   ${names_list}
    ${tmp}  get contact index letter by name  هاني
    log     ${tmp}

#
#To run the localization test
#pybot -d Results -i test_temp -v device:0180509682106615 Tests/Demo.robot
#
Test template for localization
    [Tags]  test_temp
    [Template]  Check For Elements Existance
    ${Favorite_page}
    ${Repeated_Contacts}
    ${Elgawal_Label}
    ${Elgawal_text}


Test MyOrange localization
    [Setup]   run keywords  Launch dialer  Navigate to my orange
    [Tags]  Demo  debugit  MyOrange
    [Template]  Check For Elements Existance
	${myPlan}
	${myBalance}
	${Recharge}
	${sos}
	${buyBundle}
	${payBills}
	${tikramPoints}


Test MyOrange localization p2
    [Tags]  Demo  debugit  MyOrange
    [Setup]  run keywords  Open my orange page      custome scroll down
    [Template]  Check For Elements Existance
	${orangeOffers}
	${orangeServices}
	${deviceCatalog}
	${ItemOrder}
