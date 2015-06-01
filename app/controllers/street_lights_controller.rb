class StreetLightsController < RequestsController
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
      'attribute[ISTHELI2]'=> params[:light_status],
      'first_name' => params[:first_name],
      'last_name' => params[:last_name],
      'email' => params[:email],
      'phone' => params[:phone]
    }
    request = Request.new.party_time(street_light_params)
    token = request[0]['token']
    session.clear
    redirect_to controller: 'requests', action: 'create', token: token
  end
end
