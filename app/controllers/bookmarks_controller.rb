class BookmarksController < ApplicationController
  def new
    @list = List.find(params[:list_id])
  end

  def create
    @list = List.find(params[:list_id])
    @movie = Movie.find_by(title: params[:bookmark][:movie])
    @new_bookmark = Bookmark.new(secure_params)
    @new_bookmark.movie = @movie
    if @new_bookmark.save
      redirect_to lists_path
    else
      render 'new'
    end
  end

  private

  def secure_params
    params.require(:bookmark).permit(:comment)
  end
end
