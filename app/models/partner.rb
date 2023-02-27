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

  validates :name, presence: true, length: { maximum: 255 }
  validates :address, presence: true, length: { maximum: 255 }
  validates :url, presence: true, length: { maximum: 255 }
  validates :established, presence: true, length: { maximum: 50 }

  enum provision: { 'クラウド': 0, 'オンプレミス': 1, 'その他': 2 }

  # 検索条件として利用可能な属性を指定
  def self.ransackable_attributes(auth_object = nil)
    super + ['costs_ids_eq_any', 'name', 'address', 'url', 'established']
  end

  # 検索条件として利用可能な関連を指定
  def self.ransackable_associations(auth_object = nil)
    ["ai_categories", "case_studies", "partner_cost_labels", "service_contents"]
  end
end

