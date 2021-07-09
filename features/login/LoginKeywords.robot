*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${mailfield}   id:email
${passwordfield}   id:password
${login_btn}     id:submit-login
${login}        id:button-login
${invalidusermodal}      id:invalid-username
${invalidpassmodal}     id:invalid-password

*** Keywords ***
Enter user name
    [Arguments]     ${userName}
    wait until element is visible       ${mailfield}
    input text      ${mailfield}   ${userName}

Enter Password
    [Arguments]     ${password}
    input text      ${passwordfield}   ${password}

Click Login Button
    click button    ${login_btn}

Verify Login Successfull
    wait until page contains        RCTI+ - Satu Aplikasi, Semua Hiburan        10 Seconds
    title should be     RCTI+ - Satu Aplikasi, Semua Hiburan

Verify email is incorrect
    wait until element is visible   ${invalidusermodal}     10 seconds
    page should contain element     ${invalidusermodal}     Please Try Again Email Is Incorrect

Verify phone number is incorrect
    wait until element is visible   ${invalidusermodal}     10 seconds
    page should contain element     ${invalidusermodal}     Please Try Again Phone Number Is Incorrect

Verify password is incorrect
    wait until element is visible   ${invalidpassmodal}     10 seconds
    page should contain element     ${invalidpassmodal}     Please Try Again Password Is Incorrect