class PartnerCostLabel < ApplicationRecord
  belongs_to :partner
  belongs_to :cost
end
