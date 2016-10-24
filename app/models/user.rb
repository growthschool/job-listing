class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # 该数据可关联多jobs
  has_many :jobs

  # 一对多简历
  has_many :resumes

  def admin?
    is_admin
  end
end
