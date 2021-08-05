class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :attendances
  has_many :belongings
  belongs_to :instrument
  
  with_options presence: true do
    validates :family_name
    validates :given_name
    validates :family_name_kana
    validates :given_name_kana
    validates :email
  end

  
end
