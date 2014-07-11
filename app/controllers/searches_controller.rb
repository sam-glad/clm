require 'open-uri'

class SearchesController < ApplicationController
  before_action :authenticate_user!
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
      scrape(@search.id)
      redirect_to searches_path
    else
      flash[:notice] = 'Oops! Check your error messages below.'
      render :new
    end
  end

  def destroy
    @search = Search.find(params[:id])
    if @search.destroy
      flash[:notice] = 'Search deleted!'
      redirect_to searches_path
    end
  end

  def scrape(search_id)
    ScraperWorker.perform_async(search_id)
  end

  private

  def search_params
    params.require(:search).permit(:query, :location, :category,
      :min_price, :max_price)
  end
end
