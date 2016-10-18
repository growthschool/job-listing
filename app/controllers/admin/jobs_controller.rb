class Admin::JobsController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :create, :update, :edit, :destroy]
  before_filter :require_is_admin
  def index
    @jobs = Job.all
  end

  def show
    @job = Job.find(params[:id])
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      redirect_to admin_jobs_path
    else
      render :new
    end
  end

  def edit
    @job = Job.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])
    @job.detroy
    redirect_to admin_jobs_path
  end

  private

  def require_is_admin
    if current_user.email != 'zengzheng@gmail.com'
      redirect_to root_path, alert: 'You are not admin'
    end
  end

  def job_params
    params.require(:job).permit(:title,:description)
  end
end
