class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  def admin?
    is_admin
  end

  def publish！
    self.is_hidden = false
    @self.save
  end
  def hide！
    self.is_hidden = true
    @self.save
  end
end
