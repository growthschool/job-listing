class ListsController < ApplicationController
  before_action :authenticate_user! , only: [:new,:create]
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
    @list = List.new(list_params)
    @list.user = current_user
    if @list.save
      redirect_to lists_path
    else
    render :new
    end
  end

    def update
      @list = List.find(list_params)

      if @list.update
        redirect_to lists_path, notice:'Update Success!'
      else
        render :edit
      end
    end

      def destroy
        @list = List.find(params[:id])

        if @list.destroy
          redirect_to lists_path, notice: 'Jobs deleted!'
      end
    end

  private

 def list_params
 params.require(:list).permit(:title, :description)
  end
end
