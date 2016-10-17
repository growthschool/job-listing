class GroupsController < ApplicationController
   before_action :authenticate_user! , only: [:new]
   def index
   @groups = Group.all
 end
 def new
   @group = Group.new
 end

end
