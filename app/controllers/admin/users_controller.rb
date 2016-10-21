class Admin::UsersController < ApplicationController

	layout "admin"

	def index
		
		@users = User.where(id: current_user.id)
		@users += User.where(is_admin: true).where.not(id: current_user.id)
		@users += User.where(is_admin: false).where.not(id: current_user.id)

		@resumes = Resume.all
	end

	def to_admin
		@user = User.find(params[:id])
		@user.to_admin
		redirect_to :back, notice: "更改用户#{@user.email}为管理员"
	end

	def to_user
		@user = User.find(params[:id])
		@user.to_user
		redirect_to :back, notice: "更改用户#{@user.email}为普通用户"
	end
end
