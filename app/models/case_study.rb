class CaseStudy < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :partner

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def self.ransackable_attributes(auth_object = nil)
    ["genre", "created_at", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["partners"]
  end
end
