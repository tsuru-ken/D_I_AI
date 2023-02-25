class Document < ApplicationRecord
  belongs_to :user
  mount_uploader :document_image, DocumentImageUploader

  validates :title, presence: true
  # validates :document_image, presence: true
end
