class PartnerServiceContentLabel < ApplicationRecord
  belongs_to :partner
  belongs_to :service_content
end
