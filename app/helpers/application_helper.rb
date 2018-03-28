module ApplicationHelper

  def verify_user(params)
    params[:id].to_i == current_user.id
  end

end
