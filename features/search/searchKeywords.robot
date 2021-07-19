*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${searchbar}    xpath://div[contains(text(),'rctiplus.com')]
${inputsearch}      xpath://input[@placeholder='Search for a program, genre, etc.']
${searchresult}     xpath://div[@class='tab-pane active']//p[@class='title'][contains(text(),'Search Result')]
${firstcontent}     xpath://div[@class='tab-pane active']//div[@class='content-list']//div[2]//img[1]
${title}       xpath://h1[@class='content-title']
${title_player}    xpath://div[@class='title-player']
${episodetab}   xpath://a[contains(text(),'Episode')]
${extratab}     xpath://a[contains(text(),'Extra')]

*** Keywords ***
user in the search page
    wait until element is visible   ${searchbar}    20 seconds
    click element   ${searchbar}
    sleep   5 seconds

user search "Upin" from the Program tab
    input text      ${inputsearch}      upin & ipin
    wait until element is visible   ${firstcontent}     20 second
    page should contain element     ${searchresult}
    click element   ${firstcontent}

user validate the program result
    sleep   5 seconds
    element should contain     ${title}      Upin & Ipin

user search "Upin" from the episode tab
    input text  ${inputsearch}      upin
    wait until element is visible   ${firstcontent}     20 second
    click element   ${episodetab}
    wait until element is visible   ${firstcontent}     20 second
    page should contain element     ${searchresult}
    click element   ${firstcontent}

user validate the episode result
    sleep   5 seconds
    element should contain     ${title_player}      Upin

user search "KDI" from the extra tab
    input text  ${inputsearch}      KDI
    wait until element is visible   ${firstcontent}     20 second
    click element   ${extratab}
    wait until element is visible   ${firstcontent}     20 second
    page should contain element     ${searchresult}
    click element   ${firstcontent}

user validate the extra result
    sleep   5 seconds
    element should contain     ${title_player}      KDI