class Belonging < ApplicationRecord
  enum belonging_status: { "入団中": 0, "休団": 1 }

  belongs_to :orchestra
  belongs_to :member

  validates :part_top, inclusion: [true, false]
  validates :belonging_status, presence: true
end
