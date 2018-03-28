class WinesController < ApplicationController

  def show
    @wine = Wine.find(params[:id])
  end

  def index
    @wines = Wine.all
  end

  def new
    if params[:store_id]
      @wine = Wine.new()
      @wine.store_ids << params[:store_id]
    else
      @wine = Wine.new()
    end
  end

  def create
    wine = Wine.create(wine_params)
    redirect_to wine_path(wine)
  end

  private

  def wine_params
    params[:wine].permit(:name, :description, :price, :color, :grape, :store_ids)
  end

end