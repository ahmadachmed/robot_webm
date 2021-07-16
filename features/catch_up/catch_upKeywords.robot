*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${livetvbtn}    id:action-live-tv
${mnctvchannel}  xpath://h1[contains(text(),'MNCTV')]
${gtvchannel}  xpath://h1[contains(text(),'GTV')]
${iNewschannel}  xpath://h1[contains(text(),'INEWS')]
${catchuptv}  xpath://h2[contains(text(),'Catch Up TV')]
${catchupfirst}  xpath://body/div[@id='__next']/div[1]/div[2]/div[1]/div[3]/div[1]/div[2]/div[1]/div[2]
${adsplay}      xpath://body/div[@id='__next']/div[1]/div[2]/div[1]/div[1]/div[1]/div[1]/div[2]/div[11]/div[3]/div[2]/div[1]
${playpause}    xpath://body/div[@id='__next']/div[1]/div[2]/div[1]/div[1]/div[1]/div[1]/div[2]/div[11]/div[1]/div[1]/div[1]/div[2]/div[1]
${player}   xpath://body/div[@id='__next']/div[1]/div[2]/div[1]/div[1]/div[1]/div[1]/div[2]/div[4]/video[1]
${skipads}  xpath://body/div[@id='__next']/div[1]/div[2]/div[1]/div[1]/div[1]

*** Keywords ***
user in catch up "RCTI" Channel
    click element   ${livetvbtn}
    sleep   5 seconds
    wait until element is visible  ${catchuptv}    20 seconds
    click element   ${catchuptv}

user in catch up "MNCTV" Channel
    set selenium speed      0.5 seconds
    click element   ${livetvbtn}
#   sleep   5 seconds
    click element   ${mnctvchannel}
#   sleep   5 seconds
    wait until element is visible   ${catchuptv}    20 seconds
    click element   ${catchuptv}

user in catch up "GTV" Channel
    set selenium speed      0.5 seconds
    click element   ${livetvbtn}
#    sleep   5 seconds
    click element   ${gtvchannel}
#    sleep   5 seconds
    wait until element is visible   ${catchuptv}    20 seconds
    click element   ${catchuptv}

user in catch up "iNews" Channel
    set selenium speed      0.5 seconds
    click element   ${livetvbtn}
#    sleep   5 seconds
    click element   ${iNewschannel}
#    sleep   5 seconds
    wait until element is visible   ${catchuptv}    20 seconds
    click element   ${catchuptv}

When user play one of title from the list
    wait until element is visible   ${catchupfirst}    20 seconds
    click element   ${catchupfirst}

user click play/pause player
    set selenium speed  0.5 second
    sleep   30 seconds
    wait until element is visible   ${player}   20 seconds
    click element   ${player}
    click element   ${playpause}

user validate the catch up
    page should contain element     ${playpause}