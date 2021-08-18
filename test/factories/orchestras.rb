FactoryBot.define do
  
  factory :orchestra do
    
    name { "羽田空港交響楽団" }
    sequence(:email) { Faker::Internet.free_email}
    password {"password"}
    password_confirmation { 'password' }
    
  end
  
  factory :other_orchestra do
    
    name { "成田空港交響楽団" }
    sequence(:email) { Faker::Internet.free_email}
    password {"password"}
    password_confirmation { 'password' }
    
  end
  
end

