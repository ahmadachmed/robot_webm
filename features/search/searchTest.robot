*** Settings ***
Library     SeleniumLibrary
Resource    searchKeywords.robot
Resource    ../../resources/Setup.robot

Test Setup   Chrome Mobile Go To URL   ${siteUrl}
Test Teardown  Close my Browser

*** Variables ***
${siteUrl}  https://rc-webm.rctiplus.com

*** Test Cases ***
Success search Program
    Given user in the search page
    When user search "Upin" from the Program bar
    Then user validate the program result

Success search Episode
    Given user in the search page
    When user search "Upin" from the episode bar
    Then user validate the episode result