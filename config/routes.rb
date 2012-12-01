Thegoodslife::Application.routes.draw do
  get "ben/view1"

  get "ben/view2"

  get "ben/view3"

  resources :steps
  resources :goods

  get "bihi", to: "bihi#index"

  post "login", to: "sessions#create"
  get "logout", to: "sessions#destroy"

  root to: "bihi#index"
end
