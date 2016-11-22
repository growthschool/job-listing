class ResumesController < ApplicationController
  before_action :authenticate_user!
  def index
    @resumes = Resume.all
  end


  def new
    @job = Job.find(params[:job_id])
    @resume = Resume.new
  end

  def create
    @job = Job.find(params[:job_id])
    @resume = Resume.new(resume_params)
    @resume.job = @job
    @resume.user = current_user

    if @resume.save
      # flash[:notice] = "成功提交简历"
      redirect_to job_path(@job), notice: "The resume #{@resume.content} has been uploaded."
    else
      render :new
    end
  end


 def destroy
   @resume = Resume.find(params[:id])
   @resume.destroy
   redirect_to resumes_path,notice:  "The resume #{@resume.content} has been deleted."
 end

  private
  def resume_params
    params.require(:resume).permit(:content,:attachment)
  end
end
