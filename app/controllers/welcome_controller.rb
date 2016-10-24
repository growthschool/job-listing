class WelcomeController < ApplicationController
  before_action :authenticate_user!

  def index
    flash[:"alert"] = "我好看么？"
  end
end
