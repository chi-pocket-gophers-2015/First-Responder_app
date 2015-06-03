class WelcomeController < ApplicationController

  def index
    session[:user_id] = 1
  end

end