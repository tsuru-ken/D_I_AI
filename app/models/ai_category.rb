class AiCategory < ApplicationRecord
  has_many :partner_ai_category_labels, dependent: :destroy
  has_many :partners, through: :partner_ai_category_labels
end