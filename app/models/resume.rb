# == Schema Information
#
# Table name: resumes
#
#  id         :integer          not null, primary key
#  attachment :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#  job_id     :integer
#  content    :text
#

class Resume < ApplicationRecord


    # 添加上传设置
    mount_uploader :attachment, AttachmentUploader

    # 不能为空
    validates :content, presence: true
    validates :attachment, presence: true
    #validates_presence_of :attachment
    

    # 简历隶属于某工作
    belongs_to :job
    # 简历隶属于某人
    belongs_to :user

end
