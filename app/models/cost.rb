class Cost < ApplicationRecord
  has_many :partner_cost_labels, dependent: :destroy
end
