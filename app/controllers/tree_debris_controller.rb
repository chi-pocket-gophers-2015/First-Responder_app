class TreeDebrisController < ApplicationController
  def new
    session.clear
    @category = 'tree_debris'
  end

  def create
    session[:lat] = params['lat']
    session[:lng] = params['lng']
    session[:street_address] = params['address']
    session[:zip] = params['zip']
    @request = Request.new
    render '/tree_debris/form'
  end

  def form
  end


  def update
    tree_debris_params = {
      "service_code"=> "4fd3bbf8e750846c53000069",
      "service_name" => "Tree Debris",
      'description' => params[:description],
      'address' => session[:street_address] +
        ", Chicago, IL, " + session[:zip],
      'lat' => session[:lat],
      'long' => session[:lng],
      'attribute[ISTHEAMO]' => params[:debris_size],
      'attribute[IFYES,WH]' => params[:debris_location]
    }
    request = Request.new.party_time(tree_debris_params.merge({street_address: session[:street_address],
      zip_code: session[:zip]}))
    token = request[0]['token']
    redirect_to controller: 'requests', action: 'create', token: token
  end

end
