FactoryBot.define do
  
  factory :attendance do
    
    member_id { 1 }
    practice_id { 1 }
    attendance_status { "遅刻" }
    note { "10:30到着予定です。" }
    
  end
  
end