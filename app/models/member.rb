class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :attendances
  has_many :belongings
  has_many :applies
  has_many :orchestras, through: :belongings
  has_many :practices, through: :attendances
  belongs_to :instrument

  with_options presence: true do
    validates :family_name
    validates :given_name
    validates :family_name_kana
    validates :given_name_kana
    validates :email
  end

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |member|
      member.password = SecureRandom.urlsafe_base64
      member.family_name = "田中"
      member.given_name = "未来"
      member.family_name_kana = "タナカ"
      member.given_name_kana = "ミライ"
      member.instrument_id = 1
      member.introduction = "よろしくお願いいたします。"
    end
  end

end
