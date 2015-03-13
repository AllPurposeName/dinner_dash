Rails.application.routes.draw do

  root to: "home#index"
  get '/login', to: "sessions#new"
  get '/breeds/:name', to: "breeds#show"
  get '/cats/:id', to: "cats#show"
end
