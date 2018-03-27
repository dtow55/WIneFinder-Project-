class StoresController < ApplicationController

  def new
    @store = Store.new()
  end

  def create
    store = Store.create(store_params)
    redirect_to store_path(store)
  end

  def show
    @store = Store.find(params[:id])
  end

  private

  def store_params
    params[:store].permit(:name, :address)
  end

end