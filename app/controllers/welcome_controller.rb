class WelcomeController < ApplicationController
  def index
    flash[:warning] = "啦啦啦"
  end
end
