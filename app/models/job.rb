class Job < ApplicationRecord
  # 该数据关联单user
  belongs_to :user
  # 不能为空
  validates :title, presence: true
end
