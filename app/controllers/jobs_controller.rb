class JobsController < ApplicationController
  # job的读索引
  def index
    @jobs = Job.all      
  end
end
