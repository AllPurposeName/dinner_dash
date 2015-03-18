Rails.application.routes.draw do

  root to: "home#index"
  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  get '/breeds', to: "breeds#index"
  get '/breeds/:name', to: "breeds#show", as: "breed"
  get '/cats', to: "cats#index"
  get '/cats/:id', to: "cats#show", as: "cat"
  post '/cart_items', to: "cart_items#create"
  get '/cart_items', to: "cart_items#show", as: "cart"
  post '/order_cats', to: "order_cats#create"
  get '/order/:id', to: "orders#show", as: "order"
  delete '/cart_items', to: "cart_items#delete"
  get "/orders", to: "orders#index"
  get "/logout", to: "sessions#logout"

  namespace :admin do
    resources :inventory, only: [:index]
    resources :breeds, except: [:index]
    resources :cats, except: [:index]
  end
end
