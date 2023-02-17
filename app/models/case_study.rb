class CaseStudy < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :partner


  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
end
