Rails.application.routes.draw do
  resource :requests, only: [:new, :create, :update] do
    # get '/new_form', to: 'requests#new_form'
    # get '/map', to: 'requests#map'
  end

  resource :potholes, only: [:new, :create, :update]
  resource :tree_debris, only: [:new, :create, :update]
  resource :street_lights, only: [:new, :create, :update]
  resource :graffiti, only: [:new, :create, :update]
  resource :rodents, only: [:new, :create, :update]
  resource :abandoned_vehicles, only: [:new, :create, :update]

  # get '/requests/pothole_form', to: 'requests#pothole_form'
  # get '/requests/tree_debris_form', to: 'requests#tree_debris_form'
  # get '/requests/street_light_form', to: 'requests#street_light_form'
  # get '/requests/graffiti_form', to: 'requests#graffiti_form'
  # get '/requests/rodent_form', to: 'requests#rodent_form'
  # get '/requests/abandoned_vehicle_form', to: 'requests#abandoned_vehicle_form'

  root to: 'requests#new'

end
