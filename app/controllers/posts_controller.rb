class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
    @gmaps_key = ENV['GMAPS_KEY']
  end
end
