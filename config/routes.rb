Rails.application.routes.draw do
  root to: "welcome#index"

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  resources :users, except: [:edit, :update]

  resources :locations

  resources :users_routes

  resources :routes do
    put :users_routes, on: :member
  end

  resources :pitches

  resources :ratings
end
