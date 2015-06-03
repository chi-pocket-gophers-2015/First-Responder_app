Rails.application.routes.draw do
  resource :requests, only: [:new, :create, :update] do
    get '/create', to: 'requests#create'
    get '/map', to: 'requests#map'
  end

  resources :requests, only: [:show, :index]

  resource :potholes, only: [:new, :create, :update, :show] do
    get '/form', to: 'potholes#form'
  end

  resource :tree_debris, only: [:new, :create, :update, :show] do
    get '/form', to: 'tree_debris#form'
  end

  resource :street_lights, only: [:new, :create, :update, :show] do
    get '/form', to: 'street_lights#form'
  end

  resource :graffitis, only: [:new, :create, :update, :show] do
    get '/form', to: 'graffitis#form'
  end

  resource :rodents, only: [:new, :create, :update, :show] do
    get '/form', to: 'rodents#form'
  end

  resource :abandoned_vehicles, only: [:new, :create, :update, :show] do
    get '/form', to: 'abandoned_vehicles#form'
  end

  resources :users, except: [:edit, :update, :show]
  resources :sessions, only: [:new, :create, :destroy]

  root to: 'welcome#index'

end
