class Job < ActiveRecord::Base
  #belongs_to :user
  validates :title, :minsalary, :maxsalary, presence: true
  validates :minsalary, numericality: { greater_than: 0}
  validates_numericality_of :maxsalary, greater_than: ->(job) { job.minsalary }

  def publish!
    self.is_hidden = false
    self.save
  end

  def hide!
    self.is_hidden = true
    self.save
  end

  has_many :resumes

end
