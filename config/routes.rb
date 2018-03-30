Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  
  resources :users, only: [:show] do
    resources :stores, only: [:new, :index]
  end
  
  resources :stores, only: [:create, :show, :edit, :update, :index] do 
    resources :wines, only: [:new, :show]
  end

  resources :wines, only: [:show, :index, :create, :edit, :update]
  
  root 'application#home'
  post 'users/:id/add_name', to: 'users#add_name', as: 'add_user_name'
end
