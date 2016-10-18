class JobsController < ApplicationController
  def index
    @jobs=Jobs.all
  end

  def new
    @job=Job.new
  end

  def show
    @job=Job.find(params[:id])
  end

  def edit
    @job=Job.find(params[:id])
  end

  def create
    @job=Job.new(job_params)
    if @job.save
      redirect_to jobs_path
    else
      render :new
    end
  end

  def update
    @job=Job.find(params[:id])
    if @job.update(job_params)
      redirect_to jobs_path,notic:'Update Success'
    else
      render :edit
    end

  end

  def destory
    @job=Job.find(params[:id])
    @job.destory

    redirect_to jobs_path,alert: 'Job deleted'
  end

  private

  def job_params
    params.require(:job).permit(:title,:description)
  end
end
