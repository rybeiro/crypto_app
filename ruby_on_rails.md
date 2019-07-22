# Ruby on Rails - Material de apoio
### Ruby
É uma liguagem de programação.

[Acesso a Documentação](https://www.ruby-lang.org/pt/)

### IRB (Interactive Ruby Shell)
Trata-se de um shell ou console ruby.

### RVM
Ruby Version Manager. Ferramenta de linha de comando que facilita a instalação de multiplas versões do Ruby

[Acesso a Documentação](https://rvm.io/)

**Comandos úteis**

```
rvm list known - Lista todas as versões no repositório
rvm get head - Atualiza a lista
rvm list - Lista as versões locais
rvm install x.x.x - Instala a versão especificada
rvm install x.x.x --default - Instala a versão escolhida e torna ela padrão
rvm use x.x.x - Usa uma versão especificada

```

### Ruby on Rails
É o framework de desenvolvimento de aplicações Web escrito com a liguagem Ruby.

[Acesso a Documentação](https://rubyonrails.org/)

### Gems
São Bibliotecas Reutilizáveis.

[Acesso a Documentação](https://rubygems.org/)

## Estrutura dos projeto Ruby on Rails
Os projetos estão na estruturado com padrão MVC

# Tipos de dados
### Tipos primitivos

* integer
* float
* string
* boolean

# Criando um novo projeto Ruby on Rails
O comando `rails new` cria um novo projeto

```
rails new app
```

## Scaffold - Método mágico que cria toda estrutura de arquivos MVC de um dado Objeto
O comando `rails generate scaffold` gera automaticamente os arquivos referentes ao MVC e a modelagem *(migrate)* do banco de dados com seus respectivos campos tipados.

```
rails generate scaffold Exemplos field_1:type field_2:type
```

**Detalhando:**
* **rails** é o principal comando do frameworks
* **generate** comando para geração automática pode-se abreviar para g
* **scaffold** comando que criar automaticamente os arquivos dentro da hierarquia MVC
* **Exemplo** nome do Objeto que está sendo criado inclusive nome da tabela do banco de dados
* **field** exatamente o nome do campo para a tabela
* **type** é o tipo de dado do campo da tabela, exemplo: string, integer ...

## Migrate
A partir do arquivo *migrate* gerado com o *scaffold* podemos criar a tabela do banco de dados com o comando

```
rails db:migrate
```

**Detalhando:**

*db* é o *namespace* que nomeia e identifica o local onde está a classe

*migrate* e a tarefa que será executada para criar a tabela.

## Seed
Tem como finalidade popular uma tabela do banco de dados. Essa tarefa é muito importante para o desenvolvedor ganhar tempo tendo uma tabela com dados.

```
rails db:seed
```

# Tasks
Ações que podem ser executadas automaticamente para agilizar tarefas

## Gerando suas próprias task

```
rails generate task dev exemplo
```

O comando acima gera uma tarefa com o namespace *dev* e a task *exemplo*

# Yarn
O Yarn é um gerenciador de pacotes javascript para seu projeto.
[Documentação](yarnpkg.com)

## Instalação do Yarn

```
npm install yarn
```

## Inicializar o Yarn no projeto

```
yarn init
```

Responder todas as questões como padrão após concluir será gerado um arquivo `package.json`

## Usar JS com Yarn para instalar pacotes
Acessar a Documentação e pesquisar pela biblioteca que será usado
Exemplos: `jquery e notify-js-legacy`

```
yarn add jquery
yarn add notify-js-legacy
```

Para utilizar essas bibliotecas deve-se seguir os passos:

**JS**

Adicionar no arquivo `application.js.erb` para toda aplicação

`//= require jquery`

`//= require notify-js/notify`

`//= require bootstrap/css/bootstrap`

## Reinstalando todas as bibliotecas
Observe se na raiz do projeto tem o arquivo `package.json`, se tiver rode o seguinte comando:

```
yarn install
```

# Bootstrap
## Instalação do Bootstrap no projeto
A instalação pode ser efetuada por Gem ou Npm, mas como estamos utilizando o **Yarn** para utilizá-lo entrar na Documentação do Yarn e pesquisar pela biblioteca, então:

```
yarn add bootstrap
```

> Resolva as dependências

**CSS**

Adicionar no arquivo application.css.erb

`//= require bootstrap/css/bootstrap`

## ROUTE

As rotas fazem o mapeamento para direcionamento das URI
O arquivo de configuração das rotas é *config/routes.rb*
Podemos configurar a rota padrão do servidor, ou seja, a página inicial, exemplo: controller#action

```
root to: 'welcome#index'
```

# CONTROLLER
O Controller é o responsável pela comunicação entre a View e o Model.
Para gerar um controller podemos utilizar o comando rails

```
rails generate controller nome_do_controller nome_das_actions
```

Um exemplos para criar a controller *Welcome* com a action *index* o comando abaixo também cria a view corresponde as actions informadas na geração automática.

**Criar**

```
rails generate controller Welcome (Não gera view)
rails generate controller Welcome index (Gera a view index)
```
**Apagar**

```
rails destroy controller Welcome
rails destroy controller Welcome index
```

> Sempre que utilizar o generate para criar o Controller em conjunto com as View é necessário configurar a rota

# MODEL
O Model é responsável pela comunicação com o banco de dados através do ActiveRecord.

## Rails console
Para usar o console do rails podemos utilizar o comando `rails console` ou `rails c`. Com Rails console conseguimos interagir como as Models.
Efetuando consultas utilizando o rails console

```
NomeModel.first
NomeModel.last
NomeModel.all
```

### Melhorar a visualização da syntax do console
Para isso precisamos intalar a `gem pry-rails` em seguida rodar no terminal `bundle install` melhora visualmente com marcações coloridas na sintaxe.
Veja que utlizando o pry-rails a saída e organizada e estruturada.
Criando uma nova tupla utilizando rails console

```
rails c
var = NomeModel.new
var.field_1 = "Valor"
var.field_2 = "Valor"
c.save!
```

> O símbolo de ! força a exibição das exceptions

## VIEW

### ERB
Significa Embedded Ruby. Utilizada para interpolar código ruby dentro de páginas html

**Uso**

```
<%= 1 + 1 %>
<%= Date.today %>
```

# HELPERS
São métodos que facilitam a implementação de um trecho de código e reutilização em qualquer parte do projeto, desde que implementado no arquivo `app/helpers/application_helper.rb`, exemplo de helpers padrões do Rails

* `<%= link_to '', coins_path %>` Mesmo que `<a href="/coins">Cadastrar Moedas</a>`
* `<%= image_tag image_url, size:100x80 %>` Mesmo que `img src="image.png" width="100" height="80"``

Para criar um link em uma imagem podemos mesclar os dois *helpers*, ficando assim:

```
<%= link_to do %>
  <%= image_tag "brasil.png" %>
<% end %>
```

**Criando seus HELPERS**

Para criar helper para toda aplicação sempre implementamos no `application_helper.rb` mas para melhorar o desempenho da aplicação se for apenas para um recurso implementamos em `nome-do-recurso_helper.rb`. O exemplo abaixo implementado no `application_helper.rb` formata a data no padrão americano para brasileiro.

```
def data_br(data_us)
  data_us.strftime("%d/%m/%Y %H%M")
end
```

Para chamar o helper em qualquer *view* do projeto basta fazer assim: ` <%= data_br(DateTime.now) %> `

# AMBIENTE
Ambiente que você está no Rails, ou seja, é onde sua aplicação está sendo executada no momento.
O comando para identificar o ambiente é `Rails.env` você pode testar acessando o console do Rails.
Para identificar em qual ambiente você está utilize o comando no console

```
Rails.env.development?
Rails.env.production?
```

# VARIÁVEIS

## Variáveis de instância @
Para cada objeto cria-se uma nova instância. Quando instanciamos a variável no `controller/action` ela fica disponível para todas as *view* desse controller.
Também se torna variável de sessão para cada janela do browser.

```
@varialvel
```

# HASH
Trata-se de um par de chave:valor, segue um exemplo de como atribuir e acessar

```
h = {nome:"Meu nome", curso:"Rails"}
h[:nome]
h[:curso]
```

# Query Params
`params` variável global e podemos passá-las pela URL mediante um par de chave:valor. Exemplo de url localhost:3000?*nome=Joao&curso=Rails* para acessar esse valor pegamos pela variável global `params` através de hash. Basicamente trata-se do verbo GET

```
params[:nome]
params[:curso]
```

# Partial template
Partials são partes de uma página que podem ser renderizadas e/ou reutilizadas nas views. Um exemplo poderia ser o **Menu do site**. A partial deve ficar dentro do diretório da `view` correspondente.

*Importante seguir o padrão: `_menu.html.erb`*

Nas páginas que deverão ser renderizados deve-se fazer a seguinte chamada.

```
render "menu"
```

# Layout
O padrão está em `app/view/layouts/application.html.erb` todo conteúdo do site será renderizados através desse layout. Para usar um layout diferente para uma determinada classe podemos criá-lo.
Dentro do diretório `layouts` crie uma nova página, exemplo: *demo.html.erb* copie o conteúdo padrão de *application.html.erb* depois pode utilizá-lo nas controller definindo-o, assim: `layout "demo"`.

# i18n
i18n é a siglas para **Internacionalization**. Utilizamos para traduzir nossa aplicação para outros idiomas.

[Acessando a Documentação](https://guides.rubyonrails.org/i18n.html)

## Intalar a Gem i18n

```
gem 'rails-i18n','~> 5.1'
bundle install
```

Para ativar o i18n no projeto é necessário criar o arquivo *`locale.rb`* dentro do diretório de *`config/initializers/`* e configurar esse arquivo com o padrão abaixo. (Para mais informações acessar a documentação)

```
# config/initializers/locale.rb
I18n.available_locales = [:en, "pt-BR"]
I18n.default_locale = :en
```

**Informações sobre os métodos utilizados**

* `I18n.available_locales`
  - *Esse método indica quais são os idiomas disponíveis na aplicação*
* `I18n.default_locale`
  - *Definimos qual o idioma padrão quando a aplicação inicializa.*

### Configurando os arquivos *`locales`* responsáveis pelos idiomas
Para utilizar a tradução *i18n* em todas as *`view`* do projeto temos que configurar as **chave:valor** de cada idioma. Para isso temos que acessar o arquivo *`config/locales/en.yml`* esse arquivo é do idioma Inglês e para o o idioma Português criaremos o arquivo `pt-BR.yml`. No arquivo *`en.yml`* já temos o exemplo com a **chave:hello** e o **valor: Hello World!!!** Agora no arquivo `pt-BR.yml` vamos incluir essa **chave:hello** e o **valor: Olá Mundo!**, porque é ele quem será responsável pelas traduções.

### Usando o I18n nas *View*
Para usar basta chamar com o método `I18n.t(chave)` mas se o uso for em uma view podemos usar apenas `t(chave)`. O **`t`** é abreviação para o método *`translate`*.

Para tradução das datas o Rails já possui o método `I18n.l(DateTime.now)` mas se for nas View podemos abreviar para `l(DateTime.now)`. O **`l`** é abreviação para o método *`locale`*

### Usando o I18n nas *Model*
Podemos utilizar os recursos das *Models* para tradução com *ActiveRecord*

[Acessando a Documentação](https://guides.rubyonrails.org/i18n.html#translations-for)

Para usar o recurso *I18n* nas *Models* criamos um arquivo no diretório *`config/locales/`*, por exemplo `pt-BR_models.yml` com o seguinte conteúdo.

```
"pt-BR":
  activerecord:
    models:
      coin:
        one: Moeda
        other: Moedas
    attributes:
      coin:
        id: "Código"
        description: "Descrição"
        acronym: "Sigla"
        url_image: "Url da Imagem"
        updated_at: "Atualizado em"
        created_at: "Criado em"
```
#### Alternando o idioma (i18n) dos botões (links) utilizando recursos do ActiveRecord
Para tradução dos botões/links das *view* podemos utilizar o recurso do *ActiveRecord*
Para isso basta interpolar na *view* o método `NomeModel.model_name_human`. Por exemplo:

```
link_to #{Coin.model_name_human}, coins_path
```

Também é possível usar o plural na tradução do nome da *Model* utilizando `NomeModel.model_name.human(count: 2)`. Não esqueça de configurar no arquivo *locales/pt-BR-models.yml*

**Usando esse recurso nas *View***
Para utilização nas *View* utilizamos o método `@NomeDaModel.human.attribute_name(:atributo)`

#### Alteração do idioma (i18n) em tempo de execução
No arquivo `aplication_controller.rb` todas as requisições vão passar por aqui.
Então vamos criar um *cookies* para armazenar o idioma que é inicializado na aplicação.
Depois podemos alterar em tempo de execução consultando esse *cookies*

```
berfore_action :set_locale
def set_locale
  if params[:locale]
    cookies[:locale] = params[:locale]
  end

  if cookies[:locale]
    if I18n.locale != cookies[:locale]
      I18n.locale = cookies[:locale]
    end
  end
end
```

No menu de idiomas temos que passar via *GET* o valor do idioma selecionado.
Para isso utilizamos o recurso do Rails `root_path(locale: "idioma")` esse recurso seria a mesma coisa que `?/locale=idioma`, por exemplo:

```
link_to "Portugues", root_path(locale: 'pt-BR')
```

# COOKIES
Armazenar dados no navegador
Para criar um *cookies* basta setar a chave/valor.

```
cookies[:meu_cookie] = "Esse é um cookies"
```

Nas *view* poderá ser chamado assim: `cookies[:meu_cookies]` em qualquer *view* do projeto.

# SESSION
Armazenar dados no servidor
Para criar uma *session* basta setar a chave/valor

```
session[:user] = "Seja bem vindo, Fulando de tal"
```

Nas *view* poderá ser chamado assim: `session[:user]` em qualquer *view* do projeto.
