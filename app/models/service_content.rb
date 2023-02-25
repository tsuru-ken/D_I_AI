class ServiceContent < ApplicationRecord
  has_many :partner_service_content_labels, dependent: :destroy
  has_many :partners, through: :partner_service_content_labels

  def self.ransackable_attributes(auth_object = nil)
    ["division", "created_at", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["partners"]
  end
end
