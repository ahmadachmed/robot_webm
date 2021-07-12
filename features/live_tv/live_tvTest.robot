*** Settings ***
Library     SeleniumLibrary
Resource    live_tvKeywords.robot
Resource    ../../resources/Setup.robot

Test Setup   Chrome Mobile Go To URL   ${siteUrl}
Test Teardown  Close my Browser

*** Variables ***
${siteUrl}  https://rc-webm.rctiplus.com

*** Test Cases ***
Watch Live TV RCTI Channel
    Given user in live TV "RCTI" Channel
    When user click play/pause player
    Then user validate the TV

Watch Live TV MNCTV Channel
    Given user in live TV "MNCTV" Channel
    When user click play/pause player
    Then user validate the TV

Watch Live TV GTV Channel
    Given user in live TV "GTV" Channel
    When user click play/pause player
    Then user validate the TV

Watch Live TV iNews Channel
    Given user in live TV "iNews" Channel
    When user click play/pause player
    Then user validate the TV