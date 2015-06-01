class AbandonedVehiclesController < ApplicationController
  def new
    session.clear
    @category = 'abandoned_vehicles'
  end

  def create
    session[:lat] = params['lat']
    session[:lng] = params['lng']
    session[:street_address] = params['address']
    session[:zip] = params['zip']
    @request = Request.new
    render '/abandoned_vehicles/form'
  end

  def form
  end


  def update
    abandoned_vehicle_params = {
      "service_code"=> "4ffa4c69601827691b000018",
      "service_name"=> "Abandoned Vehicle",
      'description'=> params[:description],
      'address'=> session[:street_address] +
        ", Chicago, IL, " + session[:zip],
      'lat'=> session[:lat],
      'long'=> session[:lng],
      'attribute[FQSKA1]'=> params[:vehicle_make_model],
      'attribute[FQSKA3]'=> params[:vehicle_color],
      'attribute[FQSKA4]'=> params[:vehicle_license],
      'attribute[FQSKA11]'=> params[:vehicle_body_style],
      'attribute[HOWMANYD]'=> params[:vehicle_days_parked],
    }
    request = Request.new.party_time(abandoned_vehicle_params.merge({street_address: session[:street_address],
      zip_code: session[:zip]}))
    token = request[0]['token']
    redirect_to controller: 'requests', action: 'create', token: token
  end
end
