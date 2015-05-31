class GraffitiController < ApplicationController
  def new
    session.clear
    @category = 'graffiti'
  end

  def create
    session[:lat] = params['lat']
    session[:lng] = params['lng']
    session[:street_address] = params['address']
    session[:zip] = params['zip']
    @request = Request.new
    render '/graffiti/form'
  end

  def form
  end

# WHEREIS1 - where
# WHATTYP2 - surface
# OVER6FEE - over 6ft
  def update
    graffiti_params = {
      "service_code"=> "4fd3b167e750846744000005",
      'description'=> params[:description],
      'address'=> session[:street_address] +
        ", Chicago, IL, " + session[:zip],
      'lat'=> session[:lat],
      'long'=> session[:lng],
      'attribute[WHEREIS1]'=> params[:where_located]
      'attribute[WHATTYP2]'=> params[:surface_type]
      'attribute[OVER6FEE]'=> params[:height]
    }
    request = Request.new.party_time(graffiti_params)
    binding.pry
    # params = params.merge{'lat': session['lat'], blah blah}
    # HTTParty(pothole_params)
    # Request.new(params)
    # render '/requests/success'
  end
end
