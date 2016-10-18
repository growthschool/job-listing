class JobsController < ApplicationController

def index
  @jobs = Job.all
end

def show
  @job = Job.find(params[:id])
end

def edit
  @job = Job.find(params[:id])
end

def update
  @job = Job.find(params[:id])
end

def create
  @job = Job.new(job_params)

  if @job.save
    redirect_to jobs_path
  else
  end
end

def destroy

  @job = Job.find(params[:id])

  @job.destroy
    redirect_to root_path, notice: 'Jobs deleted.'

end

private

def job_params
  params.require(:job).permit(:title, :description)
end


end
