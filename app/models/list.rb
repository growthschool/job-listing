class List < ApplicationRecord
  belongs_to :user
  has_many :list_relationships
  has_many :admins, through: :list_relationships, source: :user
  validates :title, presence: true
end
