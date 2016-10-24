class ResumesController < ApplicationController

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
      redirect_to job_path(@job), notice: "还敢来."
    else
      render :new
    end
  end

  def destroy
    @resume = Resume.find(params[:id])
    @resume.destroy
    redirect_to job_path(@job), notice:  "不要脸."
  end

  private

  def resume_params
    params.require(:resume).permit(:name, :attachment)
  end



end
