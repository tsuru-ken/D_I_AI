class Document < ApplicationRecord
  mount_uploader :document_image, DocumentImageUploader

  validates :title, presence: true
  # validates :document_image, presence: true
end
