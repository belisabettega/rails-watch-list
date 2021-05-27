class BookmarksController < ApplicationController
  def new
    @list = List.find(params[:list_id])
  end

  def create
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new(secure_params)
    @bookmark.list = @list
    if @bookmark.save
      redirect_to lists_path
    else
      render 'new'
    end
  end

  private

  def secure_params
    params.require(:bookmark).permit(:comment, :movie)
  end
end
