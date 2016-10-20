class Job < ApplicationRecord
  #belongs_to :user
  validates :title,:description,:wage_upper_bound,:wage_lower_bound,presence:true
  validates :wage_upper_bound,:wage_lower_bound,numericality:{greater_than:0}

  def publish!
    self.is_hidden = false
    self.save
  end

  def hide!
    self.is_hidden = true
    self.save
  end
  #scope :recent,-> {order("created_at DESC")}
end
