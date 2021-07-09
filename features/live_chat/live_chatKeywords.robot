*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${mailfield}   id:email
${passwordfield}   id:password
${login_btn}     id:submit-login
${login}        id:button-login
${accountbtn}   id:action-account
${livetvbtn}    id:action-live-tv
${rctichannel}  xpath://h1[contains(text(),'RCTI')]
${mnctvchannel}  xpath://h1[contains(text(),'MNCTV')]
${livechatbtn}      id:btn-expand
${chatinput}    id:chat-input
${chatoutput}   xpath://span[contains(text(),'TestBot')]
${sentbtn}      xpath://body/div[@id='__next']/div[1]/div[2]/div[1]/div[4]/div[2]/div[3]/div[1]/div[1]/div[3]/button[1]

*** Keywords ***
Login with valid credentials
    set selenium speed  1 seconds
    wait until element is visible   ${accountbtn}
    click element   ${accountbtn}
    sleep   3 seconds
    click element   ${login}
    wait until element is visible   ${mailfield}    10 seconds
    input text      ${mailfield}    ahmadilham000@gmail.com
    input text      ${passwordfield}    01101994
    click element   ${login_btn}
    set browser implicit wait   5 seconds

user go to the "RCTI" channel
    wait until element is visible   ${livetvbtn}    15 seconds
    click element   ${livetvbtn}

user go to the "MNCTV" channel
    wait until element is visible   ${livetvbtn}    15 seconds
    click element   ${livetvbtn}
    wait until element is visible   ${mnctvchannel}     15 seconds
    click element   ${mnctvchannel}


user send "TestBot" on the chat
    wait until element is visible   ${rctichannel}      15 seconds
    click element   ${livechatbtn}
    input text      ${chatinput}    TestBot
    click element   ${sentbtn}

user validate the chat
    wait until element is visible  ${chatoutput}    15 seconds
    page should contain element     ${chatoutput}
