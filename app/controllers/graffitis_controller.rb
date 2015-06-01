class GraffitisController < ApplicationController
  def new
    session.clear
    @category = 'graffitis'
  end

  def create
    session[:lat] = params['lat']
    session[:lng] = params['lng']
    session[:street_address] = params['address']
    session[:zip] = params['zip']
    @request = Request.new
    render '/graffitis/form'
  end

  def form
  end

  def update
    graffiti_params = {
      "service_code"=> "4fd3b167e750846744000005",
      "service_name"=> "Graffiti Removal",
      'description'=> params[:description],
      'address'=> session[:street_address] +
        ", Chicago, IL, " + session[:zip],
      'lat'=> session[:lat],
      'long'=> session[:lng],
      'attribute[WHEREIS1]'=> params[:where_located],
      'attribute[WHATTYP2]'=> params[:surface_type],
      'attribute[OVER6FEE]'=> params[:height],
      'first_name' => params[:first_name],
      'last_name' => params[:last_name],
      'email' => params[:email],
      'phone' => params[:phone]
    }
    @errors = Graffiti.city_params_missing(graffiti_params)
    request = Request.new.party_time(graffiti_params.merge({street_address: session[:street_address],
      zip_code: session[:zip]}))
    token = request[0]['token']
    @errors.push("Request not accepted by city") if token.nil?
    if @errors.length > 0
      render '/graffitis/form'
    end
    redirect_to controller: 'requests', action: 'create', token: token
  end
end
