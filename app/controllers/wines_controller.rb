class WinesController < ApplicationController

  def show
    @wine = Wine.find(params[:id])
  end

  def index
    if params[:varietal]
      @wines = Wine.by_varietal(params[:varietal])
    else
      @wines = Wine.all
    end
  end

  def new
    if params[:store_id]
      @wine = Wine.new()
      @wine.stores_wines.build(store_id: params[:store_id])
    else
      @wine = Wine.new()
    end
  end

  def create
    if @wine = Wine.find_by(name: wine_params[:name])
      flash[:notice] = @wine.add_store(wine_params[:stores_wines_attributes][:"0"][:store_id])
      redirect_to wine_path(@wine)
    else
      @wine = Wine.new(wine_params)
      if @wine.save
        flash[:notice] = "Wine has been successfully listed"
        redirect_to wine_path(@wine)
      else
        render :new
      end
    end
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
    params[:wine].permit(:name, :description, :price, :color, :grape, :store_ids, stores_wines_attributes: [:store_id])
  end

end