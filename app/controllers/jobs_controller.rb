class JobsController < ApplicationController
  before_action :authenticate_user! , only: [:new, :create, :update, :destroy, :edit, :show]
  #before_action :find_job_and_check_permission, only: [:edit, :update, :destroy]



  def index
    @jobs = case params[:order]
    when "by_minsalary"
      Job.where(is_hidden: false).order("minsalary DESC")
    when "by_maxsalary"
      Job.where(is_hidden: false).order("maxsalary DESC")
    else
      Job.where(is_hidden: false).order("created_at DESC")
    end
  end

  def new
    @job = Job.new
  end

  def show
    @job = Job.find(params[:id])
    unless @job.is_hidden == false || current_user.admin?
      flash[:alert] = "Unauthorized"
      redirect_to root_path
    end
  end

  def create
    @job = Job.new(job_params)
    # @job.user = current_user

    if @job.save
      redirect_to jobs_path
    else
      render :new
    end

  end

  def edit
    @job = Job.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])

    if @job.update(job_params)
      redirect_to jobs_path, notice: "Update Success"
    else
      render :edit
    end
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy
    flash[:alert] = "Job Deleted"
    redirect_to jobs_path
  end

  private

  # def find_job_and_check_permission
  #   @job = Job.find(params[:id])
  #
  #   if current_user != @job.user
  #     redirect_to root_path, alert: "You have no permission."
  #   end
  # end

  def job_params
    params.require(:job).permit(:title, :description, :email, :minsalary, :maxsalary, :is_hidden)
  end

end
