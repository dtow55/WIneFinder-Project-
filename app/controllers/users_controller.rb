class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    binding.pry
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to user_path()
  end

  private

  def user_params
    params[:user].permit(:store_name, :address)
  end

end