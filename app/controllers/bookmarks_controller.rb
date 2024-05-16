class BookmarksController < ApplicationController
  def create
    @bookmark = Bookmark.new(bookmark_params)
    @movie = Movie.find(params["bookmark"]["movie"])
    @list = List.find(params["list_id"])
    @bookmark.movie = @movie
    @bookmark.list = @list
    @bookmark.save
    redirect_to list_path(@list)
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to list_path(@bookmark.list), status: :see_other
  end


  private
  def bookmark_params
      params.require(:bookmark).permit(:comment)
  end
end
