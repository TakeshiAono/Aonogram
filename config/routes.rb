Rails.application.routes.draw do
  root to:"login#new"
  resources :pictures do
    collection do
      post :confirm
    end
    member do
      get  :favorite
    end
  end
  resources :users
  resources :accounts
  resources :login
  resources :favorites
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
