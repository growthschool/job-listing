class Admin::JobsController < ApplicationController
	before_action :authenticate_user!
	before_action :require_is_admin

	def index
		@jobs = Job.all
	end

	def new
		@job = Job.new
	end

	def create
		@job = Job.new(job_params)
		if @job.save
			redirect_to admin_jobs_path
		end
	end

	def destroy
		@job = Job.find(params[:id])
		@job.destroy
		flash[:alert] = "已成功删除"
		redirect_to admin_jobs_path
	end

	def edit
		@job = Job.find(params[:id])
	end

	def update
		@job = Job.find(params[:id])
		@job.update(job_params)
		if @job.save
			redirect_to admin_jobs_path, notice: "更新成功"
		else
			flash[:alert] = "更新信息失败"
			redirect_to edit_admin_job_path
		end
	end

	def show
		@job = Job.find(params[:id])
	end



	private 

	def require_is_admin 
		if !current_user.admin?
			redirect_to root_path, alert: "没有管理员权限"
		end
	end

	def job_params
		params.require(:job).permit(:title, :description, :min_salary, :max_salary, :contact_info)
	end


end
