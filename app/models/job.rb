class Job < ActiveRecord::Base
  #belongs_to :user
  validates :title, :minsalary, :maxsalary, presence: true
  validates :minsalary, numericality: { greater_than: 0}
  validates_numericality_of :maxsalary, greater_than: ->(job) { job.minsalary }
end
