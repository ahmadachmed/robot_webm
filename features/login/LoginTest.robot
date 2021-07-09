*** Settings ***

Library     SeleniumLibrary
Resource    LoginKeywords.robot
Resource    ../../resources/Setup.robot

Test Setup   Chrome Mobile Go To URL   ${siteUrl}
Test Teardown  Close my Browser

*** Variables ***
${siteUrl}  https://rc-webm.rctiplus.com/login
${userName}  ahmadilham000@gmail.com
${password}  01101994
${phone}        081343864823
${phonepassword}    indonesia
${incorrectmail}        ahmadilham
${incorrectphone}       1234567890
${incorrectpassword}        12345678

*** Test Case ***
Login with valid email
    Enter user name     ${userName}
    Enter Password      ${password}
    Click Login Button
    verify login successfull

Login with valid phone number
    Enter user name   ${phone}
    Enter Password      ${phonepassword}
    Click Login Button
    verify login successfull

Login with incorrect email
    Enter user name     ${incorrectmail}
    Enter Password      ${password}
    Click Login Button
    Verify email is incorrect

Login with incorrect phone number
    Enter user name     ${incorrectphone}
    Enter Password      ${password}
    Click Login Button
    Verify phone number is incorrect

Login with incorrect password
    Enter user name     ${userName}
    Enter Password      ${incorrectpassword}
    Click Login Button
    Verify password is incorrect

