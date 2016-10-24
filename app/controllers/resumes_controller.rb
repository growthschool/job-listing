class ResumesController < ApplicationController
  before_action :authenticate_user! , only: [:create, :update, :destroy, :edit]

  def index
      @resumes = Resume.all
  end

  def new
      @resume = Resume.new
  end

  def create
    @resume = Resume.new(resume_params)

    if @resume.save
      redirect_to resumes_path
    else
      render "new"
    end
  end

  def destroy
    @resume = Resume.find(params[:id])
    @resume.destroy
    redirect_to resumes_path, alert: "The resume #{@resume.name} has been deleted."
  end

private
  def resume_params
    params.require(:resume).permit(:name, :attachment)
  end
end
