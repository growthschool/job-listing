class JobsController < ApplicationController

  # job的get
  def index
    @jobs = Job.all      
  end

  # job的新建表单渲染
  def new
    @job = Job.new
  end

  # job的查看操作
  def show
    @job = Job.find(params[:id])
  end

  # job的post操作
  def create
    @job = Job.new(job_params)
    @job.save

    redirect_to jobs_path
  end

  private

  def job_params
    params.require(:job).permit(:title,:description)
  end

end
