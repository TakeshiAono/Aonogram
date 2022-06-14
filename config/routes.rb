Rails.application.routes.draw do
  get 'account/new'
  get 'login/new'
  resources :pictures do
    collection do
      post :confirm
    end
  end
  resources :users
end
