Thegoodslife::Application.routes.draw do
  get "search/index"

  get "ben/view1"

  get "ben/view2"

  get "ben/view3"

  resources :steps
  resources :goods
  resources :search

  get "bihi", to: "bihi#index"
end
