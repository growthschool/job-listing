class Resume < ApplicationRecord


    # 添加上传设置
    mount_uploader :attachment, AttachmentUploader

    # 不能为空
    #validates :attachment, presence: true
    #validates_presence_of :attachment
    validates :content, presence: true

    # 简历隶属于某工作
    belongs_to :job
    # 简历隶属于某人
    belongs_to :user

end
