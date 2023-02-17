class Cost < ApplicationRecord
  has_many :partner_cost_labels, dependent: :destroy
  has_many :partners, through: :partner_cost_labels

end
