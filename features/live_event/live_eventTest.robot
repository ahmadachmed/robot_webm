*** Settings ***
Library     SeleniumLibrary
Resource    live_eventKeywords.robot
Resource    ../../resources/Setup.robot

Test Setup   Chrome Mobile Go To URL   ${siteUrl}
Test Teardown  Close my Browser

*** Variables ***
${siteUrl}  https://rc-webm.rctiplus.com

*** Test Cases ***
Play one of Live Event if exists
    [Tags]  Skipped
    Given user in the live event page
    When user play one of live event
    Then user validate the page

Play one of Missed Event if exists
    [Tags]  Skipped
    Given user in the live event page
    When user play one of missed event
    Then user validate the page