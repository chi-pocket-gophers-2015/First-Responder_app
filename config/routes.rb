Rails.application.routes.draw do
  resource :requests, only: [:new, :create] do
    get '/map', action: :map
  end



  get '/requests/new_form', to: 'requests#new_form'

  root to: 'requests#new'

end
