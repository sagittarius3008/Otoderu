class Apply < ApplicationRecord
  belongs_to :member
  belongs_to :orchestra
  validates :member_id, presence: true
  validates :orchestra_id, presence: true
end
