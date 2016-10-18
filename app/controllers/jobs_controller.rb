class JobsController < ApplicationController
	def index
		@jobs = Job.all
	end

	def new
		@job = Job.new
	end

	def create
		@job = Job.new(job_params)
		if @job.save
			redirect_to jobs_path
		end
	end

	def destroy
		@job = Job.find(params[:id])
		@job.destroy
		flash[:alert] = "已成功删除"
		redirect_to jobs_path
	end

	def edit
		@job = Job.find(params[:id])
	end

	def update
		@job = Job.find(params[:id])
		@job.update(job_params)
		redirect_to jobs_path, notice: "更新成功"
	end

	def show
		@job = Job.find(params[:id])
	end

	private
	def job_params
		params.require(:job).permit(:title, :content, :min_salary, :max_salary, :contact_info)
	end
end
