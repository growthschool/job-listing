class ApplicationController < ActionController::Base


  def require_is_admin
    if !current_user.admin?
      redirect_to jobs_path, alert:"You are not Master!"
    end
  end

  before_action :authenticate_user! , only: [:new]
  protect_from_forgery with: :exception

end
