class Admin::JobsController < ApplicationController
    before_filter :authenticate_user!, only: [:new, :create, :update, :edit, :destroy]
    before_filter :require_is_admin

    def show
      @job = Job.find(params[:id])

      redirect_to admin_jobs_path
    end

   def require_is_admin
     if current_user.email != '1@1'
       flash[:alert] = 'You are not admin'
       redirect_to root_path
     end
   end

    private

    def job_params
     params.require(:job).permit(:title, :description)
   end
 end
