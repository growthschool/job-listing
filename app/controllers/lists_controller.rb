class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end

  def show
    @list = List.find(params[:id])
  end

  def edit
    @list = List.find(params[:id])
  end

  def create
    @list =  List.new(list_params)
    @list.save

       redirect_to lists_path
  end

  def update
    @list = List.find(params[:id])
    @list.update(list_params)
      redirect_to lists_path, notice: "Update Success !"
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    flash[:alert] = "删除"
      redirect_to lists_path
    end
  private

  def list_params
    params.require(:list).permit(:title, :description)
  end
end
