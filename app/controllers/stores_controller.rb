class StoresController < ApplicationController

  def new
    if params[:user_id]
      @store = Store.new(user_id: params[:user_id])
    else
      @store = Store.new()
    end
  end

  def create
    @store = Store.new(store_params)

    if @store.save
      flash[:notice] = "Store has been created"
      redirect_to store_path(store)
    else
      render :new
    end
  end

  def show
    @store = Store.find(params[:id])
  end

  def index
    if params[:user_id]
      @stores = User.find(params[:user_id]).stores
    else
      @stores = Store.all
    end
  end

  def edit
    @store = Store.find(params[:id])
  end

  def update
    store = Store.find(params[:id])
    store.update(store_params)
    flash[:notice] = "Store has been updated"
    redirect_to store_path(store)
  end

  private

  def store_params
    params[:store].permit(:name, :address, :user_id)
  end

end