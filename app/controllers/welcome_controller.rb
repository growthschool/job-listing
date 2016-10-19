class WelcomeController < ApplicationController
  def index
    flash[:notice] = "您好啊！"
  end
end
