Rails.application.routes.draw do

  root to: "home#index"
  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  get '/breeds', to: "breeds#index"
  get '/breeds/:name', to: "breeds#show", as: "breed"
  get '/cats/:id', to: "cats#show"
  get '/cats', to: "cats#index"

end
