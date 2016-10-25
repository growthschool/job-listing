class WelcomeController < ApplicationController
  def index
    flash[:alert] = "come on"
  end
end
