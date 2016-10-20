class Admin::UsersController < ApplicationController

	layout "admin"

	def index
		@users = User.all
		@resumes = Resume.all
	end
end
