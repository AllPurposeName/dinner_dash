Rails.application.routes.draw do

  root to: "home#index"
  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  get '/breeds/:name', to: "breeds#show"
  get '/cats/:id', to: "cats#show"
end
