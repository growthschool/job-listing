class JobsController < ApplicationController
  # 添加认证
  before_action :authenticate_user! , only: [:new, :create, :edit, :update, :destroy]
  # 查权限做路人重定向
  before_action :find_group_and_check_permission , only: [:edit, :update, :destroy]
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
    # 查权限
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
    # 查权限
    if @job.update(job_params)
      redirect_to jobs_path, notice: "Update Success"
    else
      render :new
    end
  end

  # job的delete操作
  def destroy
    # 查权限
    @job.destroy
    flash[:alert] = "Job deleted"
    redirect_to jobs_path
  end

  private

  def job_params
    params.require(:job).permit(:title,:description)
  end

  # 检查路人权限
  def find_group_and_check_permission
    @job = Job.find(params[:id])

    if current_user != @job.user
      redirect_to root_path, alert: "You have no permission."
    end
  end


end
