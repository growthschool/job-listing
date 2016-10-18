class Admin::ListsController < ApplicationController
  before_action :authenticate_user!

  def index
    @lists = current_user.postsing_lists
  end

end
