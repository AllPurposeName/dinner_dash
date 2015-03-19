Rails.application.routes.draw do
  root to: "home#index"

  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  get "/logout", to: "sessions#logout"

  resources :breeds, only: [:index]
  get '/breeds/:name', to: "breeds#show", as: "breed"
  resources :cats, only: [:index, :show]
  resources :order_cats, only: [:create]
  resources :orders, only: [:index, :show]
  resources :cart_items, only: [:create, :show]
  get '/cart_items', to: "cart_items#show", as: "cart"
  patch '/cart_items', to: "cart_items#increment", as: "increment_cart_items"
  put '/cart_items', to: "cart_items#decrement", as: "decrement_cart_items"
  delete '/cart_items', to: "cart_items#delete"

  namespace :admin do
    resources :inventory, only: [:index]
    resources :breeds, except: [:index]
    resources :cats, except: [:index]
    put '/cats/js/:id', to: 'cats#retired_update'
    resources :orders, only: [:index, :update]
  end
end
