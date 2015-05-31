class StreetLightsController < ApplicationController
  def new
    session.clear
    @category = 'street_lights'
  end

  def create
    session[:lat] = params['lat']
    session[:lng] = params['lng']
    session[:street_address] = params['address']
    session[:zip] = params['zip']
    @request = Request.new
    render '/street_lights/form'
  end

  def form
  end


  def update
    street_light_params = {
      "service_code"=> "4ffa9f2d6018277d400000c8",
      "service_name"=> "Street Light Out",
      'description'=> params[:description],
      'address'=> session[:street_address] +
        ", Chicago, IL, " + session[:zip],
      'lat'=> session[:lat],
      'long'=> session[:lng],
      'attribute[ISTHELI2]'=> params[:light_status]
    }
    request = Request.new.party_time(street_light_params)
    binding.pry
    # params = params.merge{'lat': session['lat'], blah blah}
    # HTTParty(pothole_params)
    # Request.new(params)
    # render '/requests/success'
  end
end
