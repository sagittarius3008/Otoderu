class Attendance < ApplicationRecord
  enum belonging_status: { "未入力": 0, "出席": 1, "欠席": 2, "遅刻": 3, "早退": 4 }

  belongs_to :member
  belongs_to :practice

  validates :attendance_status, presence: true

end
