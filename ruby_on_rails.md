# Estrutura dos projeto Ruby on Rails
	Os projetos estão na estruturado com padrão MVC

# Criando um novo projeto Ruby on Rails
	`rails new app`
	Comando rails cria um novo projeto com o nome `app`

# Scaffold
	`rails generate scaffold Exemplos field_1:type field_2:type`
	O comando acima gera automaticamente os arquivos referentes ao MVC e a tabela do banco de dados com seus respectivos campos tipados.
		Detalhando:
			`rails` é o principal comando do frameworks
			`generate` comando para geração automática pode-se abreviar para `g`
			`scaffold` comando que criar automaticamente os arquivos dentro da hierarquia MVC
			`Exemplo` nome do Objeto que está sendo criado inclusive nome da tabela do banco de dados
			`field` exatamente o nome do campo para a tabela
			`type` é o tipo de dado do campo da tabela, exemplo: string, integer ...

# Migrate
	`rails db:migrate`
	Cria a tabela do banco de dados. O comando para criar não muda, mas primeiro deve-se criar o arquivo `migrate` conforme padrão do framework
		Detalhando:
			`db` é o `namespace` que nomeia e identifica o local onde está a classe
			`migrate` e a tarefa que será executada para criar a tabela.

# Seed
	`rails db:seed`
	Tem como finalidade popular uma tabela do banco de dados, pensando em desenvolvimento. Essa tarefa é muito importante para o desenvolvedor ganhar tempo.
		Detalhando:
		`seed` geralmente utilizada para popular a tabela do banco de dados

# Tasks
	Ações que podem ser executadas automaticamente para agilizar tarefas
## Gerando suas próprias task
		`rails generate task dev exemplo`
		Basicamente os comandos pedem ao rails para gerar um tarefa com o namespace `dev` e a task `exemplo`

# Yarn
	O Yarn é um gerenciador de pacotes para seu código.
## Instalação do Yarn
	`npm install yarn`
## Inicializar o Yarn no projeto
	`yarn init`
	Responder todas as questões como padrão após concluir será gerado um arquivo `package.json`
## Usar o Yarn para instalar pacotes
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

# Bootstrap
## Instalação do Bootstrap no projeto
	A instalação pode ser efetuada por Gem ou Npm, mas como estamos utilizando o Yarn vamos utilizá-lo.
	Acessando.
	Exemplo: `bootstrap`
		`yarn add bootstrap`
	*Resolva as dependências*
	**CSS** Adicionar no arquivo application.css.erb
		`//= require bootstrap/css/bootstrap`
