*** Settings ***
Resource    ../resources/amazon_resources_gherkin_bdd.robot
Test Setup    Abrir navegador
Test Teardown    Fechar navegador

*** Test Cases ***

Caso de teste 01 - Acesso ao menu de "Eletrônicos"
    [Documentation]    Esta suite mostra como pode ser feito os testes com a escrita de teste no estilo Gherkin BDD.
    [Tags]    Menus
    Dado que estou na home page da Amazon.com.br
    Quando acessar o menu de "Games"
    Então o titulo da página deve ser "Games e Consoles | Amazon.com.br"
    E o texto "Games e Consoles" estiver visível na página
    E categoria "Games e Consoles" estiver visível na página
    Log    Teste de acesso ao menu de Games.

Caso de teste 02 - Pesquisa de um produto
    [Tags]    Pesquisa
    Dado que estou na home page da Amazon.com.br
    Quando pesquisar pelo produto "Xbox Series S"
    Então o titulo da página deve conter "Xbox Series S"
    Log    Teste de pesquisa de produto.


