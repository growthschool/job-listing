class Resume < ApplicationRecord
  validates :content, presence: true

  mount_uploader :attachment, AttachmentUploader
end
