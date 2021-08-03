class Attendance < ApplicationRecord
  enum belonging_status: { "-": 0, "出席": 1, "欠席": 2, "遅刻": 3, "早退": 4 }
  
  belongs_to :member
  belongs_to :practice
  
  with_options presence: true do
    validates :attendance_status
    validates :stand
  end
  
end
