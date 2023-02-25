class Partner < ApplicationRecord
  has_many :partner_service_content_labels, dependent: :destroy
  has_many :service_contents, through: :partner_service_content_labels

  has_many :partner_ai_category_labels, dependent: :destroy
  has_many :ai_categories, through: :partner_ai_category_labels

  has_many :partner_cost_labels, dependent: :destroy
  has_many :costs, through: :partner_cost_labels

  belongs_to :user

  has_many :product_infos, dependent: :destroy
  accepts_nested_attributes_for :product_infos

  has_many :case_studies, dependent: :destroy
  accepts_nested_attributes_for :case_studies

  validates :name, presence: true
  validates :address, presence: true
  validates :url, presence: true
  validates :established, presence: true

  enum provision: { 'クラウド': 0, 'オンプレミス': 1, 'その他': 2 }

  # scope :sort_name, -> {order(name: :DESC)}

  def self.ransackable_attributes(auth_object = nil)
    ["name", "address", "url", "established"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["ai_categories", "case_studies", "costs", "service_contents"]
  end
end
