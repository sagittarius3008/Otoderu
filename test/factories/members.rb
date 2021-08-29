FactoryBot.define do
  
  factory :member do
    
    transient do
      person { Gimei.name }
    end
    
    family_name { person.last.kanji }
    given_name { person.first.kanji }
    family_name_kana { person.last.katakana }
    given_name_kana { person.first.katakana }
    sequence(:email) { Faker::Internet.free_email}
    password {"password"}
    password_confirmation { 'password' }
    instrument_id {1}
    
  end
  
  factory :other_member do
    
    transient do
      person { Gimei.name }
    end
    
    family_name { person.last.kanji }
    given_name { person.first.kanji }
    family_name_kana { person.last.katakana }
    given_name_kana { person.first.katakana }
    sequence(:email) { Faker::Internet.free_email}
    password {"password"}
    password_confirmation { 'password' }
    instrument_id {1}
    
  end
  
end