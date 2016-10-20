class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def admin?
  	is_admin
  end
  
  def to_admin
  	self.is_admin = true
  	save
  end

  def to_user
  	self.is_admin = false
  	save
  end

end
