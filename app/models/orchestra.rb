class Orchestra < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :belonging
  has_many :practice
  
  with_options presence: true do
    validates :name
    validates :email
  end
  
  validates :name, uniqueness: true
  
end
