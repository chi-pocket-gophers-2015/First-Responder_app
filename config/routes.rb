Rails.application.routes.draw do
  resource :requests, only: [:new, :create, :update] do
    get '/new_form', to: 'requests#new_form'

  end
  # do
  #   get '/map', action: :map
  # end


  #post '/requests/send', to: 'requests#send'
  # get '/requests/new_form', to: 'requests#new_form'

  root to: 'requests#new'

end
