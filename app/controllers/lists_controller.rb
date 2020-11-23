class ListsController < ApplicationController
  before_action :set_list, only: [:show, :edit, :update, :destroy]
  def index
    @lists = current_user.lists
  end

  def new
    @list = List.new
  end

  def show

  end

  def create
    @list = current_user.lists.new(list_params)
    if @list.save
      redirect_to lists_path
    else
      render :new
    end
  end
  def edit

  end

  def update
    if @list.update(list_params)
      redirect_to lists_path
    else
      render :edit
    end
  end

  def destroy
    @list.destroy
    redirect_to lists_path
  end
  private

  def set_list 
    @list = current_user.lists.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:task)
  end
end
