class Document < ApplicationRecord
  belongs_to :user
  mount_uploader :document_image, DocumentImageUploader

  validates :title, presence: true, length: { maximum: 255 }
  validates :document_image, presence: true
end
