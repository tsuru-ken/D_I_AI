class AiCategory < ApplicationRecord
  has_many :partner_ai_category_labels, dependent: :destroy
end
