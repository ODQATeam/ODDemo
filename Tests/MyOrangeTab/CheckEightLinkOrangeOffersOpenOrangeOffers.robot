*** Settings ***
Library        AppiumLibrary  run_on_failure=Log Source
Library        OperatingSystem
Resource       ../../Resources/Commonutils/basicdialersetups.robot
Resource       ../../Resources/POS/Home.robot
Resource       ../../Resources/POS/MyOrange.robot

Test Setup      Launch dialer
Test Teardown   Close dialer app
*** Test Cases ***
Verify Orange Offers is eight item in list
    [Tags]   demo
    Home.Navigate to my orange
    custome scroll down
    sleep   5
    MyOrange.Verify Item Order  7  'عروض Orange'


Verify Orange Offers link opens right link
    [Tags]   demo
    Home.Navigate to my orange
    custome scroll down
    sleep  5
    MyOrange.Verify orange Offers link exist

