class ResumesController < ApplicationController
    # 添加认证
    before_action :authenticate_user! , only: [:new, :create, :edit, :update, :destroy]

    def index
        @resumes = Resume.all
    end

    def create
        @job = Job.find(params[:job_id])
        @resume = Resume.new(resume_params)
        @resume.job = @job
        @resume.user = current_user

        if  @resume.save
            redirect_to job_path(@job), notice: "Upload Success"
        else
            render :new
        end


    end

    def new
        @job = Job.find(params[:job_id])
        @resume = Resume.new
 
    end

    def edit
    end

    def show
        @resume = Resume.find(params[:id])
    end

    def update
        @resume = Resume.find(params[:id])
        @resume.update(resume_params)
        redirect_to job_resumes_path
    end

    def destroy
        @resume = Resume.find(params[:id])
        @resume.destroy
        redirect_to job_resumes_path
    end

    private

    def resume_params
        params.require(:resume).permit(:content, :attachment)
    end

end
