*** Settings ***
Library     SeleniumLibrary
Resource    amazon_page.robot


*** Variables ***
${navegador}    chrome
${URL}    https://www.amazon.com.br/
${titulo_pagina_games}    Games e Consoles | Amazon.com.br
${text_games}    Games e Consoles
${produto_pesquisa}    Xbox Series S

*** Keywords ***

Abrir navegador
    Open Browser   browser=${navegador}
    Maximize Browser Window
    
Fechar navegador
    Close Browser

Acessar a home page do site Amazon.com.br
    Go To    ${URL}
    Wait Until Element Is Visible    ${menu_games}    timeout=10s

Entrar no menu de "Games"
    Click Element   ${menu_games}

verificar se o titulo da pagina fica "${titulo_pagina_games}"
    Wait Until Element Is Visible    ${titulo_games}    timeout=5s
    Page Should Contain    ${titulo_pagina_games}

verificar se aparece a frase "${text_games}"
    Page Should Contain    ${text_games}

verificar se aparece a categoria "${text_games}"
    Page Should Contain    ${text_games}

Digitar o nome do produto "${produto_pesquisa}" no campo de pesquisa
    Input Text    ${campo_pesquisa}    ${produto_pesquisa}

Clicar no botão de pesquisa
    Click Button    ${botao_pesquisa}

verificar que os resultados da pesquisa são exibidos corretamente
    Page Should Contain    ${produto_pesquisa}


#GHERKIN STEPS DEFINITIONS

Dado que estou na home page da Amazon.com.br
    Acessar a home page do site Amazon.com.br

Quando acessar o menu de "Games"
    Entrar no menu de "Games"

Então o titulo da página deve ser "${titulo_pagina_games}"
    verificar se o titulo da pagina fica "${titulo_pagina_games}"

E o texto "${text_games}" estiver visível na página
    verificar se aparece a frase "${text_games}"

E categoria "${text_games}" estiver visível na página
    verificar se aparece a categoria "${text_games}"

Quando pesquisar pelo produto "${produto_pesquisa}"
    Digitar o nome do produto "${produto_pesquisa}" no campo de pesquisa
    Clicar no botão de pesquisa

Então o titulo da página deve conter "${produto_pesquisa}"
    verificar que os resultados da pesquisa são exibidos corretamente