class BookmarksController < ApplicationController
  def new
    @list = List.find(params[:list_id])
  end

  def create
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
    @bookmark.comment = secure_params[:comment]
    @bookmark.movie = Movie.find(secure_params[:movie])
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render 'new'
    end
  end

  private

  def secure_params
    params.require(:bookmark).permit(:comment, :movie)
  end
end
