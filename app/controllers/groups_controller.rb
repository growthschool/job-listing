class GroupsController < ApplicationController

  before_action :authenticate_user! , only: [:new, :create]

  def index
    @groups = Group.all
  end



end
