class Cost < ApplicationRecord
  has_many :partner_cost_labels, dependent: :destroy
  has_many :partners, through: :partner_cost_labels

  def self.ransackable_attributes(auth_object = nil)
    ["breakdown", "created_at", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["partners"]
  end

end
