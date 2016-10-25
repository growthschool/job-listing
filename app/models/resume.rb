class Resume < ApplicationRecord

  belongs_to :job
  belongs_to :user

  mount_uploader :attachment, AttachmentUploader # Tells rails to use this uploader for this model.

  validates :content, presence: true



  end
