class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
  end

  def add_name
    user = User.find(params[:id])
    user.update(params[:user].permit(:name))
    flash[:notice] = "Name changed!"
    redirect_to user_path(user)
  end

end