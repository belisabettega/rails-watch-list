class ListsController < ApplicationController
  before_action :find_list, only: [:show]
  def index
    @lists = List.all
  end

  def show
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(secure_params)
    if @list.save
      redirect_to lists_path
    else
      render 'new'
    end
  end

  private

  def secure_params
    params.require(:list).permit(:name)
  end

  def find_list
    @list = List.find(params[:id])
  end
end
