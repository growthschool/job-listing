class ResumesController < ApplicationController

	def index
		@resumes = Resume.all
	end

	def new
		@resume = Resume.new
	end

	def create
		@resume = Resume.new(resume_params)
		@resume.job_id = params[:job_id]
		@resume.user_id = current_user.id


		if @resume.save
			@job = Job.find(params[:job_id])
			redirect_to job_path(@job), notice: "成功上传了简历"
		else
			render :new
		end
	end

	def destroy
		@resume = Resume.find(params[:job_id])
		@resume.destroy
		redirect_to job_resumes_path, notice: "简历成功删除"
	end

	private

	def resume_params
		params.require(:resume).permit(:attachment)
	end


end
