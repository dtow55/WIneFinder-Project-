class WinesController < ApplicationController

  def show
    @wine = Wine.find(params[:id])
    if params[:store_id]
      @store = Store.find(params[:store_id])
    end
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
    if @wine = Wine.find_by(name: wine_new_params[:name])
      flash[:notice] = @wine.add_store(wine_new_params)
      redirect_to wine_path(@wine)
    else
      @wine = Wine.new(wine_new_params)
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
    if params[:store_id]
      @store = Store.find(params[:store_id])
    end
  end

  def update
    wine = Wine.find(params[:id])
    flash[:notice] = "Wine has been updated"
    redirect_to wine_path(wine)
  end

  private

  def wine_new_params
    params[:wine].permit(:name, :description, :price, :color, :grape, stores_wines_attributes: [:store_id, :inventory])
  end

  def wine_edit_params
    params[:wine].permit(:name, :description, :price, :color, :grape)
  end

end