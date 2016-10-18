class Admin::JobsController < ApplicationController
  before_action :authenticate_user! , only: [:new, :create, :edit, :update, :destroy]
  before_action :require_is_admin


  def require_is_admin
    if !current_user.admin?
      redirect_to jobs_path, alert:"You are not Master!"
    end
  end


  def index
    @jobs = Job.all
  end

  def new
    @job = Job.new
  end


  def show
    @job = Job.find(params[:id])
  end

  def edit
    @job = Job.find(params[:id])
  end

  def create
    @job = Job.new(job_params)

    if @job.save!
      redirect_to admin_jobs_path
    else
      render :new
    end
  end

  def update
    @job = Job.find(params[:id])
    @job.update(job_params)
    redirect_to admin_jobs_path, notice:"Entry Updated"
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy
    redirect_to admin_jobs_path, alert:"Entry Deleted"
  end

  private

  def job_params
    params.require(:job).permit(:title, :description)
  end

end
