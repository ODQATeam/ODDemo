*** Settings ***
Library        AppiumLibrary  run_on_failure=Log Source
Library        OperatingSystem
Resource       ../../Resources/Commonutils/basicdialersetups.robot
Resource       ../../Resources/POS/Home.robot
Resource       ../../Resources/POS/MyOrange.robot

Test Setup      Launch dialer
Test Teardown   Close dialer app
*** Test Cases ***
Verify Buy Bundle is Fifth item in list
    [Tags]      demo
    Home.Navigate to my orange
    MyOrange.Verify Item Order  4  'شراء حزم'


Verify Buy Bundle link opens right link
    [Tags]   demo
    Home.Navigate to my orange
    MyOrange.Verify buy Bundle link exist

