class User < ApplicationRecord

  has_many :documents, dependent: :destroy
  has_many :partners

  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }

  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable

  def generate_login_token
    token = SecureRandom.hex(20)
    self.update_attribute(:login_token, token)
    token
  end
end

