class Admin::JobsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :require_is_admin

  def require_is_admin
    if current_user.email != "hodor@ruiles.com"
      flash[:alert] = 'You are not Hodor!'
      redirect_to root_path
    end
  end


end
