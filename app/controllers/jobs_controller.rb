class JobsController < ApplicationController

   def index
     @jobs = Job.all
   end

   def new
     @job = Job.new
   end

   def edit
     @job = Job.find(params[:id])
   end

   def create
     @job = Job.new(job_params)
     if @job.save
       redirect_to jobs_path
     else
       render :new
     end
   end

   def update
     @job = job.find(params [:id])
     if @job.update(job_params)
       rediect_to jobs_path, notice: 'Update Success'
     else
       render :edit
     end
   end

   def destroy
     @job = job.find(params[:id])
     @job.destroy
     redirect_to jobs_path, alert: 'Job deleted'
   end


   private

   def job_params
     params.require(:job).permit(:title, :description)
   end
end
