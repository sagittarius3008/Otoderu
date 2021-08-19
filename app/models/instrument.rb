class Instrument < ApplicationRecord
  has_many :members

  validates :name, presence: true
  validates :name, uniqueness: true

end
