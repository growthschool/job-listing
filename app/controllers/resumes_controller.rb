class ResumesController < ApplicationController
  before_action :authenticate_user! , only: [:new, :create]

  def new
    @job = Job.find(params[:job_id])
    @resume = Resume.new
  end


  def create
    @resume = Resume.new(resume.params)
  end




private

  def resume.params
    params.require(:resume).permit(:job_id, :user_id, :attachment)
  end

end
