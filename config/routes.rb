Rails.application.routes.draw do
  resource :requests, only: [:new, :create] do
    resources :potholes, only: [:new, :create]
  end

  get '/requests/potholes/new_form', to: 'potholes#new_form'

end
