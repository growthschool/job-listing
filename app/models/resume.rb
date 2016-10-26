# == Schema Information
#
# Table name: resumes
#
#  id         :integer          not null, primary key
#  content    :text
#  job_id     :integer
#  user_id    :integer
#  attachment :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Resume < ApplicationRecord
  belongs_to :user
  belongs_to :job

  validates :content, presence: true

  mount_uploader :attachment, AttachmentUploader

  scope :recent, -> { order("created_at DESC")}
end
