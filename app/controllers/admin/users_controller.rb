class Admin::UsersController < ApplicationController

  layout "admin"

  def index
    @users = User.all_except(current_user)
  end

  def king
    @user = User.find(params[:id])
    @user.is_admin = true
    @user.save
    redirect_to :back
  end

  def nobody
    @user = User.find(params[:id])
    @user.is_admin = false
    @user.save
    redirect_to :back
  end

end
