# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

@users        = []
@cities       = []
@potins       = []
@messages      = []
@comments      = []

def clean_database
  puts " Etape 0 : Suppression des anciennes données."    
  User.delete_all
  City.delete_all 
  Potin.delete_all  
  PrivateMessage.delete_all
  Comment.delete_all    
end 


def create_user(number)
  puts " Etape 1 : Création de #{number} utilisateurs."    

    number.times do
    
        @users << User.create(first_name: Faker::Science.scientist,last_name: Faker::Company.name, email: Faker::Internet.email,age: 45,city:@cities[Random.new.rand(0..@cities.size-1)])     
    end
end

def create_city(number)
  puts " Etape 1 : Création de #{number} villes."    

    number.times do
    
        @cities << City.create(name: Faker::Address.city,postal_code: Faker::Address.zip)
  
        
    end
end

def create_potin(number)
    puts " Etape 2 : Création de #{number} potins."    

    number.times do

        @potins << Potin.create(title: Faker::Lorem.sentence(3, true, 4), content:Faker::Lorem.paragraph(2), user:@users[Random.new.rand(0..@users.size-1)],date:Faker::Time.between(DateTime.now - 1, DateTime.now))
   
    end    
end


def create_private_message(number)
    puts " Etape 3 : Création de #{number} messages privés."    

    number.times do

        @messages << PrivateMessage.create(content:Faker::Lorem.paragraph(2), sender:@users[Random.new.rand(0..@users.size-1)],recipient:@users[Random.new.rand(0..@users.size-1)],date:Faker::Time.between(DateTime.now - 1, DateTime.now))
   
    end    
end


def create_comment(number)
    puts " Etape 4 : Création de #{number} commentaires."    

    number.times do

        @comments << Comment.create(content:Faker::Lorem.paragraph(2), user:@users[Random.new.rand(0..@users.size-1)], potin:@potins[Random.new.rand(0..@potins.size-1)])
   
    end    
end




puts "-------------------------- *** ---------------------------------"
puts "Bonjour, nous allons créer un jeu de test pour tester nos Models"
clean_database
create_city(10)
create_user(10)
create_potin(20)
create_private_message(1)
create_comment(20)
puts "-------------------------- FIN ---------------------------------"


    
