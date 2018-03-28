class WinesController < ApplicationController

  def show
    @wine = Wine.find(params[:id])
  end

  def index
    @wines = Wine.all
  end

  def new
    
  end

  def create

  end

  private

  def wine_params
    params[:wine].permit(:name, :description, :price, :type, :grape)
  end

end