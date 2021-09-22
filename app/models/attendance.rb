class Attendance < ApplicationRecord
  enum attendance_status: { "未入力": 0, "出席": 1, "欠席": 2, "遅刻": 3, "早退": 4 }

  belongs_to :member
  belongs_to :practice

  validates :attendance_status, presence: true
  
  # 出欠未入力件数を表示するため
  def self.absent_count
    self.where(attendance_status:0).count
  end
end
