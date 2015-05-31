class PotholesController < ApplicationController
  def new
    session.clear
    # session[:category] = 'potholes'
    @category = 'potholes'
  end

  def create
    session[:lat] = params['lat']
    session[:lng] = params['lng']
    session[:street_address] = params['address']
    session[:zip] = params['zip']
    @request = Request.new
    render '/potholes/form'
  end

  def form
  end


  def update
    pothole_params = {
      "service_code"=> "4fd3b656e750846c53000004",
      'description'=> params[:description],
      'address'=> session[:street_address] +
        ", Chicago, IL, " + session[:zip],
      'lat'=> session[:lat],
      'long'=> session[:lng],
      'attribute[WHEREIST]'=> params[:where_located]
    }
    request = Request.new.party_time
    binding.pry
    # params = params.merge{'lat': session['lat'], blah blah}
    # HTTParty(pothole_params)
    # Request.new(params)
    # render '/requests/success'
  end

  def success

  end

  def pothole_params(params)
    # return {
    #   "service_code": "4fd3b656e750846c53000004",
    #   "service_name": "Pothole in Street",
    #   WHEREIST: nil,
    #   lat: session['lat'],
    #   lng: session['lng']
    # }
  end
end
