class JobsController < ApplicationController


	def index
		@jobs = case params[:order]

		when "by_lower_bound"
			Job.where(is_hidden: false).order('wage_lower_bound DESC')
		when "by_upper_bound"
			Job.where(is_hidden: false).order('wage_upper_bound DESC')
		else
			Job.where(:is_hidden => false).order("created_at DESC")
		end
		
	end

	# def create
	# 	@job = Job.new(job_params)
	# 	if @job.save
	# 		redirect_to jobs_path
	# 	end
	# end

	# def destroy
	# 	@job = Job.find(params[:id])
	# 	@job.destroy
	# 	flash[:alert] = "已成功删除"
	# 	redirect_to jobs_path
	# end

	# def edit
	# 	@job = Job.find(params[:id])
	# end

	# def update
	# 	@job = Job.find(params[:id])
	# 	@job.update(job_params)
	# 	redirect_to jobs_path, notice: "更新成功"
	# end

	def show
		@job = Job.find(params[:id])
		@resume = Resume.new
		if @job.is_hidden
			redirect_to jobs_path, notice: "404"
		end
	end

	private

	# def job_params
	# 	params.require(:job).permit(:title, :description, :wage_lower_bound, :max_salary, :contact_info)
	# end
end
