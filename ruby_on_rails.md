# Ruby on Rails - Material de apoio
## Estrutura dos projeto Ruby on Rails
	Os projetos estão na estruturado com padrão MVC

## Criando um novo projeto Ruby on Rails
	```
	rails new app
	```
	Comando rails cria um novo projeto com o nome `app`

## Scaffold
	```
	rails generate scaffold Exemplos field_1:type field_2:type
	```
	O comando acima gera automaticamente os arquivos referentes ao MVC e a tabela do banco de dados com seus respectivos campos tipados.
		Detalhando:
			- **rails** é o principal comando do frameworks
			- **generate** comando para geração automática pode-se abreviar para g
			- **scaffold** comando que criar automaticamente os arquivos dentro da hierarquia MVC
			- **Exemplo** nome do Objeto que está sendo criado inclusive nome da tabela do banco de dados
			- **field** exatamente o nome do campo para a tabela
			- **type** é o tipo de dado do campo da tabela, exemplo: string, integer ...

## Migrate
	```
	rails db:migrate
	```
	Cria a tabela do banco de dados. O comando para criar não muda, mas primeiro deve-se criar o arquivo **migrate** conforme padrão do framework
		Detalhando:
			`db` é o `namespace` que nomeia e identifica o local onde está a classe
			`migrate` e a tarefa que será executada para criar a tabela.

## Seed
	`rails db:seed`
	Tem como finalidade popular uma tabela do banco de dados, pensando em desenvolvimento. Essa tarefa é muito importante para o desenvolvedor ganhar tempo.
		Detalhando:
		`seed` geralmente utilizada para popular a tabela do banco de dados

## Tasks
	Ações que podem ser executadas automaticamente para agilizar tarefas
## Gerando suas próprias task
		```
		rails generate task dev exemplo
		```
		Basicamente os comandos pedem ao rails para gerar um tarefa com o namespace `dev` e a task `exemplo`

## Yarn
	O Yarn é um gerenciador de pacotes para seu código.
## Instalação do Yarn
	`npm install yarn`
## Inicializar o Yarn no projeto
	`yarn init`
	Responder todas as questões como padrão após concluir será gerado um arquivo `package.json`
## Usar JS com Yarn para instalar pacotes
	Acessar o site `yarnpkg.com` e pesquisar pela biblioteca que será usada
	Exemplos: `jquery e notify-js-legacy`
		`yarn add jquery`
		`yarn add notify-js-legacy`
	Para utilizar essas bibliotecas deve-se seguir os passos:
		**JS** Adicionar no arquivo `application.js.erb` para toda aplicação
			`//= require jquery`
			`//= require notify-js/notify`
			`//= require bootstrap/css/bootstrap`
## Reinstalando todas as bibliotecas
	Observe se na raiz do projeto tem o arquivo `package.json`, se tiver rode o seguinte comando:
	`yarn install`

## Utilizando o Bootstrap
## Instalação do Bootstrap no projeto
	A instalação pode ser efetuada por Gem ou Npm, mas como estamos utilizando o Yarn vamos utilizá-lo.
	Acessando. Exemplo: `bootstrap`
		```
		yarn add bootstrap
		```
		> *Resolva as dependências*

	**CSS** Adicionar no arquivo application.css.erb
		`//= require bootstrap/css/bootstrap`

## ROUTE
	As rotas mapeamento para direcionamento das URI
	O arquivo de configuração das rotas é *config/routes.rb*
	Podemos configurar a rota padrão do servidor, ou seja, a página inicial, exemplo: controller#action
	```
	root to: 'welcome#index'
	```

## CONTROLLER
	O Controller é o responsável pela comunicação entre a View e o Model.
	Para gerar um controller podemos utilizar o rails
	rails generate controller *nome_do_controller nome_das_actions*
	Exemplo para criar a controller *Welcome* com a action *index* o comando abaixo também cria a view corresponde as actions informadas na geração automática.

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

## MODEL
	O Model é responsável pela comunicação com o banco de dados através do ActiveRecord

## VIEW

### ERB
	Significa Embedded Ruby. Utilizada para interpolar código ruby dentro de páginas html
	**Uso**
	```
	<%= 1 + 1 %>
	<%= Date.today %>
```
## HELPER
São métodos que facilitam a implementação de um trecho de código e reutilização em qualquer parte do projeto, desde que implementado no arquivo `app/helpers/application_helper.rb`, exemplo de helpers padrões do Rails

- link_to (utilizado para links)
- image_tag (utilizado para imagens)

**Criando HELPER**
Para criar helper para toda aplicação sempre implementamos no `application_helper` mas para melhorar o desempenho da aplicação se for apenas para um recurso implementamos em `nome-do-recurso_helper.rb`. O exemplo abaixo implementado no `application_helper.rb` formata a data no padrão americano para brasileiro.
```
def data_br(data_us)
	data_us.strftime("%d/%m/%Y")
end
```
Para chamar o helper em qualquer view do projeto basta fazer assim: `data_br(Date.today)`
