class User < ApplicationRecord

  has_many :documents, dependent: :destroy

  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }

  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable, :confirmable
end
