*** Settings ***
Library     SeleniumLibrary

*** Keywords ***
Chrome Mobile Go To URL
    [Arguments]    ${url}    ${mobile}=Galaxy S5
    [Documentation]    Starts a Chrome Browser in Mobile Emulation with specified device model

    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    &{mobile_emulation}=    Create Dictionary    deviceName=${mobile}
    Call Method    ${options}   add_experimental_option    mobileEmulation    ${mobile_emulation}
    Call Method    ${options}   add_argument    disable-gpu
    Call Method    ${options}   add_argument    disable-popup-blocking
    Call Method    ${options}   add_argument    no-sandbox
    Call Method    ${options}   add_argument    disable-browser-side-navigation
    Call Method    ${options}   add_argument    disable-infobars

    ${desiredcap}=     Call Method     ${options}    to_capabilities
    Create Webdriver    Chrome    chrome_options=${options}     desired_capabilities=${desiredcap}
    #Create Webdriver    Remote   command_executor=http://selenium.mncplus.com/wd/hub    desired_capabilities=${options}
    GoTo    ${url}

Close my Browser
    close all browsers