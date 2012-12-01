Thegoodslife::Application.routes.draw do
  get "search/index"

  get "ben/view1"

  get "ben/view2"

  get "ben/view3"

  resources :steps

  get "give", to: "steps#new"

  resources :goods do
    member do
      get "want"
      get "give"
    end
  end
  resources :search
  resources :users do
    member do
      get "dashboard"
    end
  end

  get "bihi", to: "bihi#index"

  post "login", to: "sessions#create"
  get "login", to: "sessions#fake_login"
  get "logout", to: "sessions#destroy"
  get "account", to: "users#edit_current"

  root to: "search#index"
end
