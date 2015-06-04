Rails.application.routes.draw do
  resource :requests, only: [:new, :create, :update] do
    get '/create', to: 'requests#create'
    get '/map', to: 'requests#map'
    get '/all', to: 'requests#all'
  end

  resources :requests, only: [:show, :index]

  resource :potholes, only: [:new, :create, :update, :show] do
    get '/form', to: 'potholes#form'
    get '/map', to: 'potholes#map'
  end

  resource :tree_debris, only: [:new, :create, :update, :show] do
    get '/form', to: 'tree_debris#form'
    get '/map', to: 'tree_debris#map'
  end

  resource :street_lights, only: [:new, :create, :update, :show] do
    get '/form', to: 'street_lights#form'
    get '/map', to: 'street_lights#map'
  end

  resource :graffitis, only: [:new, :create, :update, :show] do
    get '/form', to: 'graffitis#form'
    get '/map', to: 'graffitis#map'
  end

  resource :rodents, only: [:new, :create, :update, :show] do
    get '/form', to: 'rodents#form'
    get '/map', to: 'rodents#map'
  end

  resource :abandoned_vehicles, only: [:new, :create, :update, :show] do
    get '/form', to: 'abandoned_vehicles#form'
    get '/map', to: 'abandoned_vehicles#map'
  end


  resources :users, except: [:edit, :update]
  resources :sessions, only: [:new, :create, :destroy, :failure]
  resources :identities

  post "/auth/:provider/callback", to: "sessions#create"
  get "/auth/:provider/callback", to: "sessions#create"
  get "/auth/failure", to: "sessions#failure"
  get "/logout", to: "sessions#destroy", :as => "logout"

  root to: 'welcome#index'

end
