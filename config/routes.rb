Rails.application.routes.draw do
  resource :requests, only: [:new, :create, :update] do
    # get '/new_form', to: 'requests#new_form'
    # get '/map', to: 'requests#map'
  end

  resource :potholes, only: [:new, :create, :update] do
    get '/form', to: 'potholes#form'
  end

  resource :tree_debris, only: [:new, :create, :update] do
    get '/form', to: 'tree_debris#form'
  end

  resource :street_lights, only: [:new, :create, :update] do
    get '/form', to: 'street_lights#form'
  end

  resource :graffiti, only: [:new, :create, :update] do
    get '/form', to: 'graffiti#form'
  end

  resource :rodents, only: [:new, :create, :update] do
    get '/form', to: 'rodents#form'
  end

  resource :abandoned_vehicles, only: [:new, :create, :update] do
    get '/form', to: 'abandoned_vehicles#form'
  end

  root to: 'requests#new'

end
