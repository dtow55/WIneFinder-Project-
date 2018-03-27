class StoresController < ApplicationController

  def new
    if params[:user_id]
      @store = Store.new(user_id: params[:user_id])
    else
      @store = Store.new()
    end
  end

  def create
    store = Store.create(store_params)
    redirect_to store_path(store)
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

  private

  def store_params
    params[:store].permit(:name, :address, :user_id)
  end

end