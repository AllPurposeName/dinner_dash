Rails.application.routes.draw do

  root to: "home#index"
  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  get '/breeds', to: "breeds#index"
  get '/breeds/:name', to: "breeds#show", as: "breed"
  get '/cats', to: "cats#index"
  get '/cats/:id', to: "cats#show", as: "cat"

  scope '/admin' do
    get '/inventory', to: "home#show"
    get '/breeds/:id/edit', to: "breeds#edit", as: "edit_breed"
    get '/cats/:id/edit', to: "cats#edit", as: "edit_cat"
  end
end
