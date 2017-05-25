*** Settings ***
Library        AppiumLibrary  run_on_failure=Log Source
Library        OperatingSystem
Resource       ../Resources/Commonutils/basicdialersetups.robot
Resource       ../../../Resources/POS/Home.robot
Resource       ../../../Resources/POS/MyOrange.robot

Test Setup      Launch dialer
Test Teardown   Close dialer app
*** Test Cases ***
Verify Orange Services is eight item in list
    #[Tags]  demo
    Home.Navigate to my orange
    MyOrange.Verify Item Order  8  'خدمات Orange'


Verify Orange Services link opens right link
    #[Tags]   demo
    Home.Navigate to my orange
    MyOrange.Verify orange services open right page

