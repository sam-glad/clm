class SearchesController < ApplicationController
  def index
    @user = current_user
    @searches = Search.where(user: @user)
  end
end
