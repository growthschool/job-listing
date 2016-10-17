class WelcomeController < ApplicationController
  def index
    flash[:"alert"] = "我好看么？"
  end
end
