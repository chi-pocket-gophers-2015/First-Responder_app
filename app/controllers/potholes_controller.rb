class PotholesController < ApplicationController
  def new
    # session[:category] = 'potholes'
    @category = 'potholes'
  end

  def create
    @request = Request.new
    render '/potholes/form'
  end

  def update
    # params = params.merge{'lat': session['lat'], blah blah}
    # HTTParty(pothole_params)
    # Request.new(params)
    # render '/requests/success'
  end

  def success

  end

  # private
  # def pothole_params
  #   return {
  #     lat: session['lat'],
  #     lng: session['lng'],

  #   }
  # end
end
