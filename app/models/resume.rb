class Resume < ApplicationRecord
  belongs_to :User
  belongs_to :job 
end
