class Orchestra < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :belongings
  has_many :applies
  has_many :practices
  has_many :members, through: :belongings

  with_options presence: true do
    validates :name
    validates :email
  end

  validates :name, uniqueness: true
  validates :email, uniqueness: true

  def self.guest
    find_or_create_by!(email: 'guest_orchestra@example.com') do |orchestra|
      orchestra.password = SecureRandom.urlsafe_base64
      orchestra.name = "Musica Promenade"
      orchestra.image_id = File.open("app/assets/images/img/no_image.png")
    end
  end

  # 団体に所属していればtrue
  def member_belonging?(member)
    members.include?(member)
  end

  def self.search(search)
    if search != ""
      Orchestra.where('name LIKE(?)', "%#{search}%")
    else
      Orchestra.all
    end
  end

end
