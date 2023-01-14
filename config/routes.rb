Rails.application.routes.draw do
  resources :documents, except: [:edit, :update, :destroy] do
    
    collection do
      get :search
    end

  end
  get 'home/index'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users

  root to: "home#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
