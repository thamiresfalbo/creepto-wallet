require 'faker'

puts "Seedando o banco de dados..."
def prepare
  temp = Faker::CryptoCoin.unique.coin_array
  {description: temp[0], acronym: temp[1], url_image: temp[2]}
end

15.times do
  Coin.create!(prepare)
end

puts "Sucesso!"
