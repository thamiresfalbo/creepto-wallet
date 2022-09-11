# frozen_string_literal: true

class WelcomeController < ApplicationController
  def index
    cookies[:curso] = 'Curso'
    @meu_nome = params[:nome]
    @curso = params[:curso]
  end
end
