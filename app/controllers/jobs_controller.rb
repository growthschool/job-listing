class JobsController < ApplicationController
  before_action :authenticate_user!, only: [:edit]
  def index
    @jobs = Job.all
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    @job.save

    redirect_to jobs_path
  end

  def edit
    @job = Job.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])
    @job.update(job_params)

    flash[:notice] = "世界上唯一不变的就是改变"
    redirect_to jobs_path
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy

    flash[:alert] = "你坏坏！"
    redirect_to jobs_path
  end
  private

  def job_params
    params.require(:job).permit(:title, :descripiton)
  end
end
