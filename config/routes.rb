Rails.application.routes.draw do

  root to: "home#index"
  get '/breeds/:name', to: "breeds#show"
  get '/cats/:id', to: "cats#show"
end
