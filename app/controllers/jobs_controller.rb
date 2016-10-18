class JobsController < ApplicationController
  before_action :authenticate_user! , only: [:new, :create, :edit, :update, :destroy]

  def index
    @jobs = Job.all
  end

  def new
    @job = Job.new
  end

  def create
     @job = Job.new(job_params)
     @job.user = current_user

     if @job.save
       redirect_to jobs_path
     else
       render :new
     end
  end

  def edit
    @job = Job.find(params[:id])

    if current_user !=@job.user
      redirect_to root_path , alert: "You have no permission."
    end
  end

  def update
      @job = Job.find(params[:id])

      @job.update(job_params)

      redirect_to jobs_path, notice: "Update Successful"
  end

  def destroy
       @job = Job.find(params[:id])
       @job.destroy
       flash[:alert] = "Job Deleted"
       redirect_to jobs_path
  end

  private

  def job_params
     params.require(:job).permit(:title, :description)
  end

end
