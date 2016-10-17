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

	private
	def job_params
		params.require(:job).permit(:title, :content, :min_salary, :max_salary, :contact_info)
	end
end
