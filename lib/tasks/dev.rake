namespace :dev do
  desc "Configure the development environment"
  task setup: :environment do
    if Rails.env.development?
      my_spinner("Limpando o Banco de Dados...") { %x(rails db:drop) }
      my_spinner("Criando o Banco de Dados...") { %x(rails db:create) }
      my_spinner("Migrando os dados...") { %x(rails db:migrate) }
      my_spinner("Populando...") { %x(rails db:seed) }
    else
      puts "Not in development environment."
    end
  end

  def my_spinner(msg)
    spinner = TTY::Spinner.new("[:spinner] #{msg}", format: :flip)
    spinner.auto_spin
    yield
    spinner.success("(Feito!)")
  end
end
