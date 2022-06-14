Rails.application.routes.draw do
  # get 'accounts/new'
  # get 'accounts/create'
  # get 'account/new'
  # post 'account/create'
  # get 'login/new'
  root to:"login#new"
  resources :pictures do
    collection do
      post :confirm
    end
  end
  resources :users
  resources :accounts
  resources :login
end
