class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def admin?
    email == 'liuyouzhen@gmail.com'
  end

  def admin?
    is_admin
  end

  has_many :groups
  has_many :resumes
end
