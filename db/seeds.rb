# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.find_or_create_by([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.find_or_create_by(name: 'Luke', movie: movies.first)

puts "Criando categorias"
categories = ["Imóveis", "Construção", "Calçados", "Eletrônicos", "Roupas", "Livros"]
categories.each do |category|
    Category.find_or_create_by(description: category)
end
puts "Categorias criadas ... 100%"

puts "Criando adminstradores"
    Admin.create!(email: "admin@padrao.com", password:"123456", password_confirmation:"123456")
puts "Administradores criados ... 100%"