class Admin::JobsController < ApplicationController

  # 添加认证
  before_action :authenticate_user! , only: [:new, :create, :update, :edit, :destroy]
  # 限定admin
  before_filter :require_is_admin

  # 设定主页
  layout "admin"

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
    @resumes = @job.resumes
  end

  # job的编辑操作
  def edit
    @job = Job.find(params[:id])
  end

  # 可以改变状态按钮
  def publish
    @job = Job.find(params[:id])
    @job.is_publish = true
    @job.save

    redirect_to :back
  end

  def private
    @job = Job.find(params[:id])
    @job.is_publish = false
    @job.save

    redirect_to :back    
  end




  # job的post操作
  def create
    @job = Job.new(job_params)
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
    params.require(:job).permit(:title,:description,:wage_upper_bound, :wage_lower_bound, :contact_email, :is_publish)
  end

end
