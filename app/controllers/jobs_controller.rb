class JobsController < ApplicationController
  before_action :authenticate_user!, only: [:edit]
  def index
    @jobs = Job.all.order("created_at DESC")
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)

    if @job.save
      flash[:notice] = "已上传成功，请等待管理员处理"
      redirect_to jobs_path
    else
      render :new
    end
  end

  def show
    @job = Job.find(params[:id])

    if @job.is_hidden
      flash[:warning] = "This job already archieved"
      redirect_to root_path
    end
  end

  def edit
    @job = Job.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])

    if @job.update(job_params)
      flash[:notice] = "修改成功"
      redirect_to jobs_path
    else
      render :edit
    end
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy

    flash[:alert] = "你坏坏！"
    redirect_to jobs_path
  end

  private

  def job_params
    params.require(:job).permit(:title, :descripiton, :wage_upper_bound, :wage_lower_bound, :contact_email)
  end
end
