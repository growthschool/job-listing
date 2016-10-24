class Resume < ApplicationRecord
  validates :content, presence: true
end
