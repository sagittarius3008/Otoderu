class Post < ApplicationRecord
  validates :body, presence: true
  belongs_to :orchestra
  belongs_to :member
end
