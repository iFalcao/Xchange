namespace :util do
  desc "TODO"
  task generate_admins: :environment do
    puts "Criando adminstradores"
    10.times do 
        Admin.create!(
            name: Faker::Name.name,
            role: [0, 0, 1, 1, 1].sample,
            email: Faker::Internet.email, 
            password:"123456", 
            password_confirmation:"123456")
    end
    puts "Administradores criados ... 100%"
  end

end
