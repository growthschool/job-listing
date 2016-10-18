class List < ApplicationRecord
  belongs_to :user
  has_many : admins, through: :list_relationship, source: :user
  validates :title, presence: true
end
