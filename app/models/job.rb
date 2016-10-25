# == Schema Information
#
# Table name: jobs
#
#  id               :integer          not null, primary key
#  title            :string
#  description      :text
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  user_id          :integer
#  wage_upper_bound :integer
#  wage_lower_bound :integer
#  contact_email    :string
#  is_publish       :boolean          default(FALSE)
#

class Job < ApplicationRecord
  # 该数据关联单user
  belongs_to :user
  # 与简历一对多
  has_many :resumes


  # 不能为空
  validates :title,:wage_upper_bound, :wage_lower_bound, presence: true

end
