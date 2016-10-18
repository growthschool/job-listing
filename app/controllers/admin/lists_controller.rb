class Admin::ListsController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :create, :update, :edit, :destroy]
  before_filter :require_is_admin


  def index
    @lists = List.all
  end

    def show
      @list = List.find(params[:id])
    end

    def edit
      @list = List.find(params[:id])
    end

    def new
      @list = List.new
    end

    def create
      @list = List.new(list_params)

      if @list.save
        redirect_to admin_lists_path
      else
        render :new
      end
    end

      def update
        @list = List.find(params[:id])

        if @list.update(list_params)
          redirect_to admin_lists_path
        else
          render :edit
        end
      end

      def destroy
        @list = List.find(params[:id])
        @list.destroy

        redirect_to admin_lists_path
      end

    private

    def require_is_admin
      if !current_user.admin?

        flash[:alert] = 'You are not the admin'
        redirect_to root_path
      end
    end

    def list_params
      param.require(:list).permit(:title, :description)
    end

  end
