*** Settings ***
resource    amazon_resources.robot
Test Setup    Abrir navegador
Test Teardown    Fechar navegador

*** Test Cases ***

Caso de teste 01 - Acesso ao menu de "Eletrônicos"
    [Tags]    Menus
    Acessar a home page do site Amazon.com.br
    Entrar no menu de "Games"
    verificar se o titulo da pagina fica "Games e Consoles"
    verificar se aparece a frase "Games e Consoles"
    verificar se aparece a categoria "Computadores e Informática"
    Log    Teste de acesso ao menu de Games.

Caso de teste 02 - Pesquisa de um produto
    [Tags]    Pesquisa
    Acessar a home page do site Amazon.com.br
    Digitar o nome do produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa
    verificar que os resultados da pesquisa são exibidos corretamente
    Log    Teste de pesquisa de produto.

