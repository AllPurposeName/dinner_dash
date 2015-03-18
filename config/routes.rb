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
  resources :cart_items, only: [:create, :delete, :show]
  get '/cart_items', to: "cart_items#show", as: "cart"

  namespace :admin do
    resources :inventory, only: [:index]
    resources :breeds, except: [:index]
    resources :cats, except: [:index]
    resources :orders, only: [:index]
  end
end
