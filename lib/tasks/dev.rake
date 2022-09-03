# frozen_string_literal: true

namespace :dev do
  desc 'Configure the development environment'
  task setup: :environment do
    if Rails.env.development?
      my_spinner('Limpando o Banco de Dados...') { `rails db:drop` }
      my_spinner('Criando o Banco de Dados...') { `rails db:create` }
      my_spinner('Migrando os dados...') { `rails db:migrate` }
      `rails dev:add_mining`
      `rails dev:add_coins`
    else
      puts 'Not in development environment.'
    end
  end

  desc 'Add the shitcoins'
  task add_coins: :environment do
    if Rails.env.development?
      def prepare
        coin = Faker::CryptoCoin.unique.coin_array
        { description: coin[0], acronym: coin[1], url_image: coin[2], mining_type: MiningType.all.sample }
      end

      my_spinner('Adicionando moedas...') do
        5.times do
          Coin.find_or_create_by!(prepare)
        end
      end
    else
      puts 'Not in development environment.'
    end
  end

  desc 'Add mining types'
  task add_mining: :environment do
    if Rails.env.development?
      my_spinner('Cadastrando tipos de mineração...') do
        mining_types = [
          { description: 'Proof of Work', acronym: 'PoW' },
          { description: 'Proof of Stake', acronym: 'PoS' },
          { description: 'Proof of Capacity', acronym: 'PoC' }
        ]

        mining_types.each do |mining|
          MiningType.find_or_create_by!(mining)
        end
      end
    else
      puts 'Not in development environment.'
    end
  end

  private

  def my_spinner(msg)
    spinner = TTY::Spinner.new("[:spinner] #{msg}", format: :flip)
    spinner.auto_spin
    yield
    spinner.success('(Feito!)')
  end
end
