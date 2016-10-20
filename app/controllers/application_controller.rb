class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def require_is_admin
    if !current_user.admin?
      flash[:alert] = 'You are not admin'
      redirect_to root_path
    end
  end

  def require_is_hidden
    if !current_job.is_hidden?
      flash[:alert] = '这个工作是隐藏的'
      redirect_to root_path
    end
  end

end
