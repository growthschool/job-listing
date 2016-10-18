class JobsController < ApplicationController
  # 添加认证
  before_action :authenticate_user! , only: [:new, :create]
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

  # job的编辑操作
  def edit
    @job = Job.find(params[:id])
  end

  # job的post操作
  def create
    @job = Job.new(job_params)
    @job.user = current_user
    if @job.save
      redirect_to jobs_path
    else
      render :new
    end
  end

  # job的put操作
  def update
    @job = Job.find(params[:id])
    if @job.update(job_params)
      redirect_to jobs_path, notice: "Update Success"
    else
      render :new
    end
  end

  # job的delete操作
  def destroy
    @job = Job.find(params[:id])
    @job.destroy
    flash[:alert] = "Job deleted"
    redirect_to jobs_path
  end

  private

  def job_params
    params.require(:job).permit(:title,:description)
  end

end
