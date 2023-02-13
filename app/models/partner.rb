class Partner < ApplicationRecord
  has_many :partner_service_content_labels, dependent: :destroy

  has_many :partner_ai_category_labels, dependent: :destroy

  has_many :partner_cost_labels, dependent: :destroy

  validates :name, presence: true
  validates :address, presence: true
  validates :url, presence: true
  validates :established, presence: true
end
