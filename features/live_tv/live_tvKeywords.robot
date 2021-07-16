*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${livetvbtn}    id:action-live-tv
${rctichannel}  xpath://h1[contains(text(),'RCTI')]
${mnctvchannel}  xpath://h1[contains(text(),'MNCTV')]
${gtvchannel}  xpath://h1[contains(text(),'GTV')]
${iNewschannel}  xpath://h1[contains(text(),'INEWS')]
${playpause}    xpath://body/div[@id='__next']/div[1]/div[2]/div[1]/div[1]/div[1]/div[1]/div[2]/div[11]/div[1]/div[1]/div[1]/div[2]/div[1]
${player}   xpath://body/div[@id='__next']/div[1]/div[2]/div[1]/div[1]/div[1]/div[1]/div[2]/div[4]/video[1]
${skipads}  xpath://body/div[@id='__next']/div[1]/div[2]/div[1]/div[1]/div[1]

*** Keywords ***
user in live TV "RCTI" Channel
    click element   ${livetvbtn}

user in live TV "MNCTV" Channel
    click element   ${livetvbtn}
    sleep   10 seconds
    click element   ${mnctvchannel}

user in live TV "GTV" Channel
    click element   ${livetvbtn}
    sleep   10 seconds
    click element   ${gtvchannel}

user in live TV "iNews" Channel
    click element   ${livetvbtn}
    sleep   10 seconds
    click element   ${iNewschannel}

user click play/pause player
    set selenium speed  1 second
    sleep   30 seconds
    click element   ${player}
    click element   ${playpause}

user validate the TV
    page should contain element     ${playpause}