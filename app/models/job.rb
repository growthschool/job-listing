class Job < ApplicationRecord
  # 该数据关联单user
  belongs_to :user
  # 与简历一对多
  has_many :resumes


  # 不能为空
  validates :title,:wage_upper_bound, :wage_lower_bound, presence: true

end
