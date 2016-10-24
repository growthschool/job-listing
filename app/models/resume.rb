class Resume < ApplicationRecord
    mount_uploader :attachment, AttachmentUploader
    validates :name, presence: true
    validates :attachment, presence: true

    belongs_to :job
    belongs_to :user

end
