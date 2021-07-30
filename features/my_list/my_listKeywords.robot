*** Settings ***
Library     SeleniumLibrary

*** Variable ***
${account}      id:action-account
${mailfield}   id:email
${passwordfield}   id:password
${login_btn}     id:submit-login
${library}  xpath://div[@id='action-library']
${firstprogram}     xpath://div[@class='content-search']//div[@class='content-list']/div[1]/div[1]/img[1]
${mylistbtn}    xpath://body[1]/div[1]/div[1]/div[2]/div[1]/div[2]/div[1]/div[2]/button[1]
${titles}   xpath://div[@class='program-detail-main-wrapper']/div[3]/h1[1]
${my_list}  id:action-mylist
${list}     xpath://div[@class='wrapper-content container-box-ml']/div[2]/div[1]/img[1]

*** Keywords ***
user login with valid credentials
    wait until element is visible   ${mailfield}    10 seconds
    input text      ${mailfield}    ahmadilham000@gmail.com
    input text      ${passwordfield}    01101994
    click element   ${login_btn}
    sleep   5 seconds

user add one of program to his list
    wait until element is visible   ${library}      20 seconds
    click element   ${library}
    wait until element is visible   ${firstprogram}     20 seconds
    click element   ${firstprogram}
    sleep   5 seconds
    click element   ${mylistbtn}
    ${title}=   get text    ${titles}
    set suite variable  ${title}

user go to the my list
    wait until element is visible   ${account}
    click element   ${account}
    sleep   5 seconds
    click element   ${my_list}

user remove one from the list
    sleep   5 seconds
    click element   ${list}
    sleep   5 seconds
    click element   ${mylistbtn}
    click element   ${account}
    sleep   5 seconds
    click element   ${my_list}

user validate the list was empty
    sleep   5 seconds
    page should not contain element     ${list}

user validate the list
    sleep   5 seconds
    element attribute value should be      ${list}      alt     ${title}