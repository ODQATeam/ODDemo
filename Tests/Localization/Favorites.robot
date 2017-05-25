*** Settings ***
Library        AppiumLibrary  run_on_failure=Log Source
Library        OperatingSystem
Resource       ../../Resources/Commonutils/basicdialersetups.robot
Resource       ../../Resources/POS/Home.robot
Resource       ../../Resources/POS/Favorites.robot

Test Setup      Launch dialer
Test Teardown   Close dialer app
*** Keywords ***
Assert localized item existance
    [Arguments]     ${locator_to_find}
    log     do the assertion step for , ${locator_to_find}


*** Test Cases ***
Test template for localization
    #[Tags]  demo
    [Template]  Check For Elements Existance TwoArg
    ${Favorite_page}    ${false}
    ${Elgawal_text}     ${false}
    ${Repeated_Contacts}     ${true}
    ${Elgawal_Label}     ${true}


