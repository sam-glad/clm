class SearchesController < ApplicationController
  def index
    @user = current_user
    @searches = @user.Search.all
  end
end
