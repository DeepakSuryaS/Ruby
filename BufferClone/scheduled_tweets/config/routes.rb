# Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

Rails.application.routes.draw do
  # GET /about
  get "about", to: "about#index"

  # Defines the root path route ("/")
  # the below is the same as - get "/", to: "main#index"
  root "main#index"
end
