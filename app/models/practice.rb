class Practice < ApplicationRecord
  has_many :attendances, dependent: :destroy
  has_many :members, through: :attendances
  belongs_to :orchestra

  with_options presence: true do
    validates :schedule
    validates :start_at
    validates :end_at
    validates :start_time
    validates :place
  end
  validates :stand, inclusion: [true, false]

end
