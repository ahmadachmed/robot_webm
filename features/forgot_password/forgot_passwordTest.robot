*** Settings ***
Library     SeleniumLibrary
Resource    forgot_passwordKeywords.robot
Resource    ../../resources/Setup.robot

Test Setup   Chrome Mobile Go To URL   ${siteUrl}
Test Teardown  Close my Browser

*** Variable ***
${siteUrl}  https://rc-webm.rctiplus.com/login

*** Test Cases ***
Not registered Alert
    Given user go to the forgot password page
    When user insert 08912345678 in the field
    Then alert should be : Please Try Again Phone Number Is Incorrect

Incorrect email alert
    Given user go to the forgot password page
    When user insert ahmadchmed in the field
    Then alert should be : Please Try Again Email Is Incorrect

Incorrect phone number alert
    Given user go to the forgot password page
    When user insert 12345678 in the field
    Then alert should be : Please Try Again Phone Number Is Incorrect

Insert less than 6 character alert
    Given user go to the forgot password page
    When user insert 1234 in the field
    Then alert should be : Username must at least 6 characters