class ResumesController < ApplicationController

	before_action :authenticate_user!

	def index
		@resumes = Resume.all
	end

	def new
		@resume = Resume.new
	end

	def create

		@resume = Resume.new
		@job = Job.find(params[:job_id])

		if params[:resume]
			@resume.attachment = params[:resume]["attachment"]
			@resume.job_id = params[:job_id]
			@resume.user_id = current_user.id

			if @resume.save
				@job = Job.find(params[:job_id])
				redirect_to job_path(@job), notice: "成功上传了简历"
			else
			# render :new
				@job = Job.find(params[:job_id])			
				redirect_to job_path(@job), alert: "未上传简历"
			end
		
		else 
			redirect_to job_path(@job), alert: "未上传简历"
		end
	end

	def destroy
		@resume = Resume.find(params[:job_id]) #should be updated!!
		@resume.destroy
		redirect_to job_resumes_path, notice: "简历成功删除"
	end

	private

	# def resume_params
		# params.require(:resume).permit([:attachment, :user_id, :job_id])
		# params.permit([:attachment, :user_id, :job_id, :utf8, :authenticity_token, :resume, :commit])
	# end

end
