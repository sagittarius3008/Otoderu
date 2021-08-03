class Instrument < ApplicationRecord
  has_many :member
  
  validates :name, presence: true
  
end
