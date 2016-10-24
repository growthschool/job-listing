class Resume < ApplicationRecord
	mount_uploader :attachment, AttachmentUploader
	validates :job_id, presence: true
	validates :user_id, presence: true
	validates :attachment, presence: true
end
