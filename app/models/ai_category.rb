class AiCategory < ApplicationRecord
  has_many :partner_ai_category_labels, dependent: :destroy
  has_many :partners, through: :partner_ai_category_labels

  def self.ransackable_attributes(auth_object = nil)
    ["genre", "created_at", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["partners"]
  end
  
end