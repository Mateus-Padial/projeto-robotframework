# Projeto de automação de testes da Amazon

Projeto de testes web automatizados para o site [Amazon Brasil](https://www.amazon.com.br/), desenvolvido com Robot Framework e SeleniumLibrary. Os cenários cobrem a navegação até a área de Games e a pesquisa de produtos.

## Tecnologias

- **Robot Framework**: estrutura dos casos de teste, keywords e organização dos resources.
- **SeleniumLibrary**: interação com o navegador e com os elementos da página.
- **Google Chrome**: navegador configurado atualmente para a execução.

## Estrutura do projeto

| Arquivo ou pasta | Responsabilidade |
| --- | --- |
| `amazon_page.robot` | Page Object com os locators dos elementos da Amazon. |
| `amazon_resources.robot` | Keywords reutilizáveis de navegação, pesquisa e verificações; importa o Page Object. |
| `amazon_resources_gherkin_bdd.robot` | Keywords reutilizáveis com nomes em português no estilo Gherkin; importa o Page Object. |
| `amazon_testes.robot` | Casos de teste escritos com as keywords convencionais. |
| `amazon_testes_gherkin_bdd.robot` | Os mesmos fluxos expressos com steps em português no estilo Gherkin/BDD. |
| `amazon_testes_gherkin_bdd_forma2.robot` | Variação da suite BDD que reutiliza `amazon_resources.robot`. |
| `resultados/` | Relatórios e resultados de execuções anteriores. |

## Padrões e organização

### Page Object

Os seletores dos elementos da página ficam separados das ações e verificações. O arquivo `amazon_page.robot` centraliza os locators, por exemplo:

```robotframework
*** Variables ***
${menu_games}       xpath=//a[@href='/Games-Consoles/b/?ie=UTF8&node=7791985011&ref_=nav_cs_video_games'][contains(.,'Games')]
${campo_pesquisa}   id=twotabsearchtextbox
```

Os resources de keywords importam esse arquivo na seção `*** Settings ***`. Assim, quando um locator precisar ser atualizado, ele pode ser alterado em um só lugar, sem misturar seletores com a lógica dos cenários.

```robotframework
*** Settings ***
Resource    amazon_page.robot
```

### Resources e keywords reutilizáveis

Os arquivos `amazon_resources*.robot` agrupam as operações, como abrir e maximizar o navegador, acessar a página inicial, clicar no menu, pesquisar um produto e conferir o conteúdo exibido. As suites importam esses resources e compõem os passos de cada caso de teste.

### Estilo Gherkin/BDD

A suite BDD usa steps em português — por exemplo, `Dado`, `Quando`, `Então` e `E` — implementados como keywords do Robot Framework. É uma organização dos cenários em estilo Gherkin; o projeto não configura um parser/plugin Gherkin separado.

## Cenários cobertos

- Acesso à área de Games e verificação do conteúdo apresentado.
- Pesquisa do produto `Xbox Series S` e verificação dos resultados.

Os testes estão organizados com as tags `Menus` e `Pesquisa`. O navegador é aberto no setup de cada teste e fechado no teardown.

## Como executar

Instale o Robot Framework, a SeleniumLibrary e tenha o Chrome disponível. Com o RobotCode configurado no ambiente do projeto, execute a suite desejada:

```powershell
robotcode robot amazon_testes.robot
robotcode robot amazon_testes_gherkin_bdd.robot
robotcode robot amazon_testes_gherkin_bdd_forma2.robot
```

Para executar somente um grupo de cenários por tag, por exemplo:

```powershell
robotcode robot -i Pesquisa amazon_testes.robot
```

Os testes acessam o site real; a execução depende da disponibilidade da Amazon e pode ser afetada por mudanças na página, conteúdo regional ou mecanismos anti-automação.
