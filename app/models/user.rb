class User < ApplicationRecord

  has_many :documents, dependent: :destroy
  has_many :partners

  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }

  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable

  def self.guest_admin
    find_or_create_by!(email: 'guest_admin@example.com') do |user|
      user.name = 'ゲスト管理者'
      user.password = SecureRandom.urlsafe_base64
      user.password_confirmation = user.password
      user.admin = true
    end
  end


  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.name = 'ゲスト'
      user.password = SecureRandom.urlsafe_base64
      user.password_confirmation = user.password
    end
  end
  
  def guest?
    email == 'guest@example.com'
  end
end

  


