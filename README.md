# Projeto de automação de testes da Amazon

Projeto de testes web automatizados para o site [Amazon Brasil](https://www.amazon.com.br/), desenvolvido com Robot Framework e SeleniumLibrary. Os cenários cobrem a navegação até a área de Games e a pesquisa de produtos.

## Tecnologias

- **Robot Framework**: estrutura dos casos de teste, keywords e organização dos resources.
- **SeleniumLibrary**: interação com o navegador e com os elementos da página.
- **Google Chrome**: navegador configurado atualmente para a execução.

## Estrutura do projeto

| Arquivo ou pasta | Responsabilidade |
| --- | --- |
| `tests/` | Suites de testes Robot Framework. |
| `resources/` | Keywords e recursos compartilhados pelas suites. |
| `resources/pages/` | Page Objects e locators das páginas. |
| `resultados/` | Relatórios e resultados de execuções anteriores. |
| `.vscode/` | Configurações locais do VS Code. |

### Suites e resources

| Arquivo | Responsabilidade |
| --- | --- |
| `tests/amazon_testes.robot` | Casos de teste escritos com as keywords convencionais. |
| `tests/amazon_testes_gherkin_bdd.robot` | Fluxos expressos com steps em português no estilo Gherkin/BDD. |
| `tests/amazon_testes_gherkin_bdd_forma2.robot` | Variação da suite BDD que reutiliza o resource convencional. |
| `resources/pages/amazon_page.robot` | Page Object com os locators dos elementos da Amazon. |
| `resources/amazon_resources.robot` | Keywords reutilizáveis de navegação, pesquisa e verificações; importa o Page Object. |
| `resources/amazon_resources_gherkin_bdd.robot` | Keywords reutilizáveis no estilo Gherkin; importa o Page Object. |

## Padrões e organização

### Page Object

Os seletores dos elementos da página ficam separados das ações e verificações. O arquivo `resources/pages/amazon_page.robot` centraliza os locators, por exemplo:

```robotframework
*** Variables ***
${menu_games}       xpath=//a[@href='/Games-Consoles/b/?ie=UTF8&node=7791985011&ref_=nav_cs_video_games'][contains(.,'Games')]
${campo_pesquisa}   id=twotabsearchtextbox
```

Os resources de keywords importam esse arquivo na seção `*** Settings ***`. Assim, quando um locator precisar ser atualizado, ele pode ser alterado em um só lugar, sem misturar seletores com a lógica dos cenários.

```robotframework
*** Settings ***
Resource    pages/amazon_page.robot
```

### Resources e keywords reutilizáveis

Os arquivos `resources/amazon_resources*.robot` agrupam as operações, como abrir e maximizar o navegador, acessar a página inicial, clicar no menu, pesquisar um produto e conferir o conteúdo exibido. As suites importam esses resources usando caminhos relativos, por exemplo:

```robotframework
Resource    ../resources/amazon_resources.robot
```

Essa organização separa os casos de teste (`tests/`), a lógica reutilizável (`resources/`) e os locators específicos de páginas (`resources/pages/`).

### Estilo Gherkin/BDD

A suite BDD usa steps em português — por exemplo, `Dado`, `Quando`, `Então` e `E` — implementados como keywords do Robot Framework. É uma organização dos cenários em estilo Gherkin; o projeto não configura um parser/plugin Gherkin separado.

## Cenários cobertos

- Acesso à área de Games e verificação do conteúdo apresentado.
- Pesquisa do produto `Xbox Series S` e verificação dos resultados.

Os testes estão organizados com as tags `Menus` e `Pesquisa`. O navegador é aberto no setup de cada teste e fechado no teardown.

## Como executar

Instale o Robot Framework, a SeleniumLibrary e tenha o Chrome disponível. Com o RobotCode configurado no ambiente do projeto, execute a suite desejada:

```powershell
robotcode robot tests/
```

Para executar somente um grupo de cenários por tag, por exemplo:

```powershell
robotcode robot -i Pesquisa tests/
```

Para executar uma suite específica, filtre pelo nome completo dela com `-bl`, conforme o longname listado por `robotcode discover tests`.

Os testes acessam o site real; a execução depende da disponibilidade da Amazon e pode ser afetada por mudanças na página, conteúdo regional ou mecanismos anti-automação. Os relatórios e screenshots já existentes foram mantidos no lugar para preservar os resultados anteriores.
