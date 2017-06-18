namespace :util do
  desc "Cria adminstradores fakes"
  task generate_admins: :environment do
    puts "Criando adminstradores"
    10.times do 
        Admin.create!(name: Faker::Name.name,
            role: [0, 0, 1, 1, 1].sample,
            email: Faker::Internet.email, 
            password:"123456", 
            password_confirmation:"123456")
    end
    puts "Administradores criados ... 100%"
  end

  desc "Cria usuários fakes"
  task generate_members: :environment do
    puts "Criando usuários fakes"
    50.times do 
        Member.create!(email: Faker::Internet.email,
            password:"123456",
            password_confirmation:"123456")
    end
    puts "Membros usuários ... 100%"
  end

  desc "Cria anúncios fakes"
  task generate_ads: :environment do
    puts "Criando anúncios...."
    100.times do 
        Ad.create!(title: Faker::Lorem.sentence([2,3,4,5].sample),
            description: Faker::Lorem.paragraphs(2),
            member: Member.all.sample,
            category: Category.all.sample)
    end
    puts "Anúncios criados ... 100%"
  end
end