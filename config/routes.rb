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
  delete '/cart_items', to: "cart_items#delete"

  namespace :admin do
    resources :inventory, only: [:index]
    get '/breeds/:id/edit', to: "breeds#edit", as: "edit_breed"
    get '/cats/:id/edit', to: "cats#edit", as: "edit_cat"
  end
end
