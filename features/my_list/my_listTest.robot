*** Settings ***
Library     SeleniumLibrary
Resource    my_listKeywords.robot
Resource    ../../resources/Setup.robot

Test Setup   Chrome Mobile Go To URL   ${siteUrl}
Test Teardown  Close my Browser

*** Variable ***
${siteUrl}  https://rc-webm.rctiplus.com/login

*** Test Cases ***
Add a program to My List
    [Tags]  Skipped
    Given user login with valid credentials
    And user add one of program to his list
    When user go to the my list
    Then user validate the list

Remove a program from My List
    [Tags]  Skipped
    Given user login with valid credentials
    When user go to the my list
    And user remove one from the list
    Then user validate the list was empty