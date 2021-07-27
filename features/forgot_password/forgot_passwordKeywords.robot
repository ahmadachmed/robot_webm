*** Settings ***
Library     SeleniumLibrary

*** Variable ***
${fgtpassbtn}   id:forgot-password-link
${username}    id:input-email-phone
${nextbtn}      id:button-next
${feedback}     id:invalid-feedback

*** Keywords ***
user go to the forgot password page
    wait until element is visible   ${fgtpassbtn}
    click element   ${fgtpassbtn}

user insert ${number} in the field
    wait until element is visible   ${username}
    input text  ${username}     ${number}

Then alert should be : ${alert}
    wait until element is visible   ${feedback}
    element should contain      ${feedback}     ${alert}
