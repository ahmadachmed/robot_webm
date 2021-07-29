*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${lebtn}    id:action-live-event
${le-live}  xpath://section[@class='le-live']/div[2]/div[1]/div[1]/div[1]/img[1]
${le-missed}    xpath://section[@class='le-missed_event']/div[2]/div[1]/div[1]/div[1]/img[1]
${le-bar}   xpath://a[contains(text(),'Live Event')]
${me-bar}   xpath://a[contains(text(),'Missed Event')]

*** Keywords ***
user in the live event page
    wait until element is visible   ${lebtn}
    click element   ${lebtn}

user play one of live event
    Sleep   3 seconds
    ${status}   ${value}=   Run Keyword And Ignore Error    click element   ${le-live}
    run keyword if  '${status}' == 'FAIL'   log source     Live Event doesn't Exists

user play one of missed event
    Sleep   3 seconds
    ${status}   ${value}=   Run Keyword And Ignore Error    click element   ${le-missed}
    run keyword if  '${status}' == 'FAIL'   log source     Live Event doesn't Exists

user validate the page
    wait until element is visible   ${le-bar}
    page should contain element     ${le-bar}
    page should contain element     ${me-bar}

