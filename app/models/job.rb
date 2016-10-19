class Job < ApplicationRecord
  #belongs_to :user
  validates :title,:description,:wage_upper_bound,:wage_lower_bound,presence:true
  validates :wage_upper_bound,:wage_lower_bound,numericality:true
end
