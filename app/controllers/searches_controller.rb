class SearchesController < ApplicationController
  def index
    @searches = Search.where(user: current_user)
  end

  def show
    @search = Search.find(params[:id])
  end

  def new
    @search = Search.new
  end

  def create
    @search = Search.new(search_params)
    @search.user = current_user

    if @search.save
      flash[:notice] = 'Search added!'
      redirect_to searches_path
    else
      flash[:notice] = 'Oops! Check your error messages below.'
      render :new
    end
  end

  private

  def search_params
    params.require(:search).permit(:query, :location, :category,
      :min_price, :max_price)
  end
end
