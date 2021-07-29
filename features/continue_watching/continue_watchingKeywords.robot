*** Settings ***
Library     SeleniumLibrary

*** Variable ***
${account}      id:action-account
${mailfield}   id:email
${passwordfield}   id:password
${login_btn}     id:submit-login
${exclusive}      https://rc-webm.rctiplus.com/exclusive
${firstcontent}     xpath://div[@class='col-edit col']/div[2]/img[1]
${watchlist}    xpath://li[@id='action-continue-watching']/div[1]/div[1]/img[1]


*** Keywords ***
user login with valid credentials
    wait until element is visible   ${mailfield}    10 seconds
    input text      ${mailfield}    ahmadilham000@gmail.com
    input text      ${passwordfield}    01101994
    click element   ${login_btn}
    sleep   5 seconds

user play one of program from exclusive
    go to    ${exclusive}
    sleep   5 seconds
    ${title}=    get element attribute    ${firstcontent}   src
    set suite variable      ${title}
    click element   ${firstcontent}
    sleep   30 seconds

user go to the account page
    click element   ${account}
    sleep   5 seconds

the program must be exist in the continue watching list
    wait until element is visible   ${watchlist}    20 seconds
    page should contain element     ${watchlist}
    element attribute value should be   ${watchlist}    src    ${title}
