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
    validates :instrument_id
  end

  validates :email, uniqueness: true

  # パスワードには半角英数字6文字以上（deviseの初期設定）を用いる
  # 重大な個人情報を取り扱わないため

  # 全角で入力されていること
  VALID_NAME_REGEX = /^[ぁ-んァ-ヶー一-龠]+$/.freeze
  validates :family_name, length: { maximum: 5 }, format: { with: VALID_NAME_REGEX, :multiline => true }
  validates :given_name, length: { maximum: 9 }, format: { with: VALID_NAME_REGEX, :multiline => true }

  # 全角カタカナで入力されていること
  VALID_NAME_KANA_REGEX = /[ァ-ヴ]/.freeze
  validates :family_name_kana, format: { with: VALID_NAME_KANA_REGEX, :multiline => true }
  validates :given_name_kana, format: { with: VALID_NAME_KANA_REGEX, :multiline => true }

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

  # def new_practice?
  #   my_practice.schedule - Date.today >= 0 && (@most_recent_date - Date.today).abs >= (my_practice.schedule - Date.today).abs
  # end

  # def has_practice?(member)
  #   member.practices == []
  # end
end
