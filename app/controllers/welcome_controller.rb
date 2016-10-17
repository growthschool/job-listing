class WelcomeController < ApplicationController
  before_action :authenticate_user!,only:[:index]
  def index
    flash[:warning]="早安，你好！"
  end
end
