class Practice < ApplicationRecord
  has_many :attendances
  has_many :members, through: :attendances
  belongs_to :orchestra

  with_options presence: true do
    validates :schedule
    validates :start_time
    validates :end_time
    validates :place
  end
  validates :stand, inclusion: [true, false]

end
