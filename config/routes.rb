Rails.application.routes.draw do

  root to: "home#index"
  get '/breeds/:name', to: "breeds#show"
end
