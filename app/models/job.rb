class Job < ApplicationRecord
  validates :title, presence: true
  validates :wage_upper_bound, presence: true
  validates :wage_lower_bound, presence: true
  validates :wage_lower_bound, numericality: { greater_than: 0}

  def hide_this_job!
    self.is_hidden = true
    save
  end

  def publish_this_job!
    self.is_hidden = false
    save
  end

  has_many :resumes
end
