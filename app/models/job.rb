class Job < ActiveRecord::Base
 validates :title, :wage_upper_bound, :wage_lower_bound, presence: true
end
