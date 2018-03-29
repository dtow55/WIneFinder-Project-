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
    if wine = Wine.find_by(name: wine_params[:name])
      flash[:notice] = wine.add_store(wine_params[:store_ids])
    else
      wine = Wine.create(wine_params)
      flash[:notice] = "Wine has been successfully listed"
    end

    redirect_to wine_path(wine)
  end

  def edit
    @wine = Wine.find(params[:id])
  end

  def update
    wine = Wine.find(params[:id])
    wine.update(wine_params)
    flash[:notice] = "Wine has been updated"
    redirect_to wine_path(wine)
  end

  private

  def wine_params
    params[:wine].permit(:name, :description, :price, :color, :grape, :store_ids)
  end

end