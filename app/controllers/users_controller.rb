class UsersController < ApplicationController
  before_action :authenticate_user!

  def bookmarks
    @bookmarks = current_user.bookmarks
  end
end
