class Document < ApplicationRecord
  belongs_to :user
  has_one_attached :file

  validates :title, presence: true
  validates :file, presence: true
  validates :user_id, presence: true

  validate :correct_document_mime_type

  private

  def correct_document_mime_type
    if file.attached? && !file.content_type.in?(%w(application/zip application/pdf))
      errors.add(:file, 'Must be a PDF or a ZIP file')
    end
    if file.attached? && file.blob.byte_size > 5.megabytes
      errors.add(:file, 'Must be less than 5MB in size')
    end
  end
end
