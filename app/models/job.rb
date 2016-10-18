class Job < ActiveRecord::Base
  #belongs_to :user
  validates :title, :minsalary, :maxsalary, presence: true
end
