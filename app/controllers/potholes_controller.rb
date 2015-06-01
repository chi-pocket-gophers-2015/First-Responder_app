class PotholesController < ApplicationController
  def new
    session.clear
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
    RequestRecord.create(token: token, image: params['image'])
    pothole_params = {
      "service_code"=> "4fd3b656e750846c53000004",
      "service_name"=> "Pothole in Street",
      'description'=> params[:description],
      'address'=> session[:street_address] +
        ", Chicago, IL, " + session[:zip],
      'lat'=> session[:lat],
      'long'=> session[:lng],
      'attribute[WHEREIST]'=> params[:where_located]
    }
    token = request[0]['token']
    request = Request.new.party_time(pothole_params)
    session.clear
    redirect_to controller: 'requests', action: 'create', token: token
  end

end
