Thegoodslife::Application.routes.draw do
  get "ben/view1"

  get "ben/view2"

  get "ben/view3"

  resources :steps

  get "bihi", to: "bihi#index"
end
