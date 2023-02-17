class ServiceContent < ApplicationRecord
  has_many :partner_service_content_labels, dependent: :destroy
  has_many :partners, through: :partner_service_content_labels
end
