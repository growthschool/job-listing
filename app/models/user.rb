class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :lists
  has_many :list_relationships
  has_many :postsing_lists, :through => :list_relationships, :source => :list

  def admin?
    is_admin
  end

end
