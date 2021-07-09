*** Settings ***
Library     SeleniumLibrary
Resource    live_chatKeywords.robot
Resource    ../../resources/Setup.robot

Test Setup   Chrome Mobile Go To URL   ${siteUrl}
Test Teardown  Close my Browser

*** Variables ***
${siteUrl}  https://rc-webm.rctiplus.com


*** Test Cases ***
Send chat from Live TV RCTI channel
    Given Login with valid credentials
    And user go to the "RCTI" channel
    And user send "TestBot" on the chat
    Then user validate the chat

Send chat from Live TV MNCTV channel
    Given Login with valid credentials
    And user go to the "MNCTV" channel
    And user send "TestBot" on the chat
    Then user validate the chat

