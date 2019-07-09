class WelcomeController < ApplicationController
  def index
    # COOKIES
    cookies[:curso] = "Ruby on Rails"
    # SESSION
    session[:user] = "Fulano de tal"
    # Para exibir as variaveis de instancia na welcome#index os paramentros
    # deve ser passado pela url no formato ?nome=valor&curso=valor
    @nome =  params[:nome].nil? ? "Anonimo" : params[:nome]
    @curso= params[:curso].nil? ? "Não encontrado" : params[:curso]
  end
end
