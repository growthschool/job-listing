class ResumesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    redirect_to new_job_resume_path
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
      flash[:notice] = "你还真投啊"
      redirect_to jobs_path
    else
      render :new
    end
  end

  private

  def resume_params
    params.require(:resume).permit(:content, :attachment)
  end

end
