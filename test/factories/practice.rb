FactoryBot.define do
  
  factory :practice do
    
    schedule { "2021-08-11" }
    start_at { "2000-01-01 09:00:00" }
    end_at { "2000-01-01 12:00:00" }
    place { "パルテノン多摩小ホール" }
    note { "9:30振り下ろし。真夏序曲～" }
    stand { true }
    start_time { "2021-08-11 16:55:34" }
    
  end
  
end