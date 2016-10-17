class ListsController < ApplicationController
  before_action :authenticate_user! , only: [:new]
  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end



  def create
    @list = List.new(list_params)

    if @list.save
      redirect_to lists_path

    else
    render :new
    end

  end

  private

 def list_params
 params.require(:list).permit(:title, :description)
  end
end
