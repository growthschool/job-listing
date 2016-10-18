class JobsController < ApplicationController

  # job的get
  def index
    @jobs = Job.all      
  end

  # job的post
  def new
    @job = Job.new
  end

  # job的put
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
