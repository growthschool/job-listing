class Post < ApplicationRecord
  belongs_to :user
  belongs_to :job
  mount_uploader :attachment, AttachmentUploader
  validates :content, presence: true
end
