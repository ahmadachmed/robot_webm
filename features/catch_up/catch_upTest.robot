*** Settings ***
Library     SeleniumLibrary
Resource    ../../resources/Setup.robot
Resource    catch_upKeywords.robot

Test Setup   Chrome Mobile Go To URL   ${siteUrl}
Test Teardown  Close my Browser

*** Variables ***
${siteUrl}  https://rc-webm.rctiplus.com

*** Test Cases ***
Watch Catch Up TV from "RCTI" Channel
    Given user in catch up "RCTI" Channel
    When user play one of title from the list
    And user click play/pause player
    Then user validate the catch up

Watch Catch Up TV from "MNCTV" Channel
    Given user in catch up "MNCTV" Channel
    When user play one of title from the list
    And user click play/pause player
    Then user validate the catch up

Watch Catch Up TV from "GTV" Channel
    Given user in catch up "GTV" Channel
    When user play one of title from the list
    And user click play/pause player
    Then user validate the catch up

Watch Catch Up TV from "iNews" Channel
    Given user in catch up "iNews" Channel
    When user play one of title from the list
    And user click play/pause player
    Then user validate the catch up