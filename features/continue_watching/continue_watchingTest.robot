*** Settings ***
Library     SeleniumLibrary
Resource    continue_watchingKeywords.robot
Resource    ../../resources/Setup.robot

Test Setup   Chrome Mobile Go To URL   ${siteUrl}
Test Teardown  Close my Browser

*** Variable ***
${siteUrl}  https://rc-webm.rctiplus.com/login

*** Test Cases ***
Continue watching test from exclusive program
    Given user login with valid credentials
    When user play one of program from exclusive
    And user go to the account page
    Then the program must be exist in the continue watching list
