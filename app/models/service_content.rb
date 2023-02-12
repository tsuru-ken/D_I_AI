class ServiceContent < ApplicationRecord
  has_many :partner_service_content_labels, dependent: :destroy
end
