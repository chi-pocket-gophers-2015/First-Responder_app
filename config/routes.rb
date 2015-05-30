Rails.application.routes.draw do
  resource :requests, only: [:new, :create] do
    get '/map', action: :map
  end



  get '/requests/new_form', to: 'requests#new_form'
  get '/requests/graffiti_form', to: 'requests#graffiti_form'
  get '/requests/pothole_form', to: 'requests#pothole_form'
  get '/requests/rodent_form', to: 'requests#rodent_form'
  get '/requests/street_light_form', to: 'requests#street_light_form'
  get '/requests/tree_debris_form', to: 'requests#tree_debris_form'
  get '/requests/tree_trim_form', to: 'requests#tree_trim_form'
  get '/requests/abandoned_vehicle_form', to: 'requests#graffiti_form'

  root to: 'requests#new'

end
