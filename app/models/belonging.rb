class Belonging < ApplicationRecord
  enum belonging_status: { "入団中": 0, "休団": 1 }
  
  belongs_to :orchestra
  belongs_to :member
  
  with_options presence: true do
    validates :part_top
    validates :belonging_status
  end
  
end
