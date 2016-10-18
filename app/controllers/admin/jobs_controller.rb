class Admin::JobsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :require_is_admin

  def index
    @jobs = Job.all
  end

  def require_is_admin
    unless current_user.admin?
      flash[:alert] = 'You are not Hodor!'
      redirect_to root_path
    end
  end

  def edit
    @job = Job.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])
    @job.update(job_params)

    flash[:notice] = "HODOR Rules!"
    redirect_to admin_jobs_path
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy

    flash[:alert] = "All Hail HODOR!!!"
    redirect_to admin_jobs_path
  end

  private

  def job_params
    params.require(:job).permit(:title, :descripiton)
  end
end
