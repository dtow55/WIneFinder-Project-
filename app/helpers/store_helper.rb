module StoreHelper
    
  def store_owner_logged_in?(store)
      (store.user_id == current_user.id) if user_signed_in?
  end

end
