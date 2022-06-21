*** Settings ***
Library                             SeleniumLibrary
Suite Setup                         Open Browser                ${baseUrl}          ${browser}
Suite Teardown                      Close Browser

*** Variables ***
${baseUrl}                          https://pub-eish-dev.keponet.com/frontend/login
${browser}                          chrome
${emailUser}                        jenareishsatu@yopmail.com
${pass}                             12345678

***Test Cases***

I login with invalid email and invalid password
    Maximize Browser Window
    Input Text                      //input[@id="email"]                                cecepp@gmail.com
    Input Text                      //input[@id="password"]                             salahsalah
    Click Element                   //button[@type="submit"]
    Element Should Be Visible       //input[@class="form-control is-invalid"]

I login with invalid email but valid password
    Maximize Browser Window
    Input Text                      //input[@id="email"]                                cecepp@gmail.com
    Input Text                      //input[@id="password"]                             ${pass}
    Click Element                   //button[@type="submit"]
    Element Should Be Visible       //input[@class="form-control is-invalid"]

I login with valid email but invalid password
    Maximize Browser Window
    Input Text                      //input[@id="email"]                                ${emailUser}
    Input Text                      //input[@id="password"]                             salahsalah
    Click Element                   //button[@type="submit"]
    Element Should Be Visible       //div[@class="alert alert-danger text-danger"]    

I login without filling email and password
    Maximize Browser Window
    Input Text                      //input[@id="email"]                                ${EMPTY}
    Input Text                      //input[@id="password"]                             ${EMPTY}
    Click Element                   //button[@type="submit"]
    Element Should Not Be Visible   //img[@id="menu-logo"]

I login with filling email but empty password 
    Maximize Browser Window
    Input Text                      //input[@id="email"]                                ${emailUser}
    Input Text                      //input[@id="password"]                             ${EMPTY}
    Click Element                   //button[@type="submit"]
    Element Should Not Be Visible   //img[@id="menu-logo"]

I login with empty email but filling password 
    Maximize Browser Window
    Input Text                      //input[@id="email"]                                ${EMPTY}
    Input Text                      //input[@id="password"]                             ${pass}
    Click Element                   //button[@type="submit"]
    Element Should Not Be Visible   //img[@id="menu-logo"]

I login with valid email and valid password
    Maximize Browser Window
    Input Text                      //input[@id="email"]                                ${emailUser}
    Input Text                      //input[@id="password"]                             ${pass}
    Click Element                   //button[@type="submit"]
    Element Should Be Visible       //img[@id="menu-logo"]

    
