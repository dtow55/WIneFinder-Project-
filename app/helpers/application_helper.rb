module ApplicationHelper

  def own_user_page?(user_id)
    user_id == current_user.id if user_signed_in?
  end

end
