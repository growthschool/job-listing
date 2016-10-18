class Job < ApplicationRecord
  # 防止为空
  validates :title, presence: true
end
