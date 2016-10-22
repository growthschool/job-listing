class Admin::JobsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :require_is_admin
  layout "admin"

  def index
    @jobs = Job.all
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)

    if @job.save
      flash[:notice] = "上传成功"
      redirect_to jobs_path
    else
      render :new
    end
  end

  def show
    @job = Job.find(params[:id])
  end

  def edit
    @job = Job.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])
    if @job.update(job_params)
      flash[:notice] = "HODOR Rules!"
      redirect_to admin_jobs_path
    else
      render :edit
    end
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy

    flash[:alert] = "All Hail HODOR!!!"
    redirect_to admin_jobs_path
  end

  def hide_this_job
    @job = Job.find(params[:id])
    @job.hide_this_job!

    redirect_to :back
  end

  def publish_this_job
    @job = Job.find(params[:id])
    @job.publish_this_job!

    redirect_to :back
  end

  private

  def require_is_admin
    unless current_user.admin?
      flash[:alert] = 'You are not Hodor!'
      redirect_to root_path
    end
  end

  def job_params
    params.require(:job).permit(:title, :descripiton, :wage_upper_bound, :wage_lower_bound, :contact_email, :is_hidden)
  end
end
