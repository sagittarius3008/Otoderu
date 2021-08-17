FactoryBot.define do
  
  factory :member do
    transient do
      person { Gimei.name }
    end

    # ユーザ名
    family_name { person.last.kanji }
    given_name { person.first.kanji }
    family_name_kana { person.last.katakana }
    given_name_kana { person.first.katakana }
    sequence(:email) { |n| "hiro#{n}@example.com"}
    password {"password"}
    password_confirmation { 'password' }
    instrument_id {9}
  end
end