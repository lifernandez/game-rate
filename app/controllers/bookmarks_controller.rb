class BookmarksController < ApplicationController
  def index
    @bookmarks = current_user.bookmarks.includes(:game)
  end

  def create
    @game = Game.find(params[:game_id])
    @bookmark = current_user.bookmarks.new(game: @game)

    if @bookmark.save
      redirect_to game_path(@game), notice: 'Game bookmarked!'
    else
      redirect_to game_path(@game), alert: 'Unable to bookmark game.'
    end
  end
end
