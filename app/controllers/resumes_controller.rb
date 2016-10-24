class ResumesController < ApplicationController
  before_action :authenticate_user! , only: [:create, :update, :destroy, :edit]

  def index
      @resumes = Resume.all
  end

  def new
      @resume = Resume.new
  end

  def create
    @job = Job.find(params[:job_id])
    @resume = Resume.new(resume_params)

    @resume.job = @job
    @resume.user = current_user

    if @resume.save
      redirect_to job_path(@job), notice: "The resume #{@resume.name} has been uploaded."
    else
      render "new"
    end
  end

  def destroy
    @resume = Resume.find(params[:id])
    @resume.destroy
    redirect_to admin_jobs_path, alert: "The resume #{@resume.name} has been deleted."
  end

private
  def resume_params
    params.require(:resume).permit(:name, :attachment)
  end
end
