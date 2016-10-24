class PostsController < ApplicationController

before_filter :authenticate_user!, :only => [:new, :create]

def new
  @job = Job.find(params[:job_id])
  @post = Post.new
end

def create
  @job = Job.find(params[:job_id])
  @post = Post.new(post_params)
  @post.job = @job
  @post.user = current_user

  if @post.save
    redirect_to jobs_path#(@job), notice: "The resume #{@resume.name} has been uploaded."
  else
    render :new
  end
end


private

def post_params
  params.require(:post).permit(:content)
end

end
