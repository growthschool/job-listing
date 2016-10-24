class Resume < ApplicationRecord
    # 简历隶属于某工作
    belongs_to :job
    # 简历隶属于某人
    belongs_to :user

end
