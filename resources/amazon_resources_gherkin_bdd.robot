*** Settings ***
Library     SeleniumLibrary
Resource    pages/amazon_page.robot


*** Variables ***
${navegador}    chrome
${URL}    https://www.amazon.com.br/

*** Keywords ***

Abrir navegador
    Open Browser   browser=${navegador}
    Maximize Browser Window
    
Fechar navegador
    Close Browser

Dado que estou na home page da Amazon.com.br
    Go To    ${URL}
    Wait Until Element Is Visible    ${menu_games}    timeout=10s

Quando acessar o menu de "Games"
    Click Element   ${menu_games}

Então o titulo da página deve ser "${titulo_pagina_games}"
    Wait Until Element Is Visible    ${titulo_games}    timeout=5s
    Page Should Contain    ${titulo_pagina_games}

E o texto "${text_games}" estiver visível na página
    Page Should Contain    ${text_games}

E categoria "${text_games}" estiver visível na página
    Page Should Contain    ${text_games}

Quando pesquisar pelo produto "${produto_pesquisa}"
    Input Text    ${campo_pesquisa}    ${produto_pesquisa}
    Click Button    ${botao_pesquisa}

Então o titulo da página deve conter "${produto_pesquisa}"
    Page Should Contain    ${produto_pesquisa}


    