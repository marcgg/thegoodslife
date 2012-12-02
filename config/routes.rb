Thegoodslife::Application.routes.draw do
  get "search/index"

  resources :steps

  get "give", to: "steps#new"

  resources :goods do
    member do
      get "want"
      get "give"
    end
  end

  resources :search

  resources :users
  get 'dashboard', to: 'users#dashboard'

  post "login", to: "sessions#create"
  get "login", to: "sessions#fake_login"
  get "logout", to: "sessions#destroy"
  get "account", to: "users#edit_current"

  root to: "search#index"
end
