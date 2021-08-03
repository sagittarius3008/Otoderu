class Practice < ApplicationRecord
  has_many :attendance
  belongs_to :orchestra
  
  with_options presence: true do
    validates :schedule
    validates :start_time
    validates :end_time
    validates :place
  end
  
end
