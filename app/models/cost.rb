class Cost < ApplicationRecord
  has_many :partner_cost_labels, dependent: :destroy
  has_many :costs, through: :partner_cost_labels

end
