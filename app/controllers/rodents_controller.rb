class RodentsController < ApplicationController
  def new
    session.clear
    @category = 'rodents'
  end

  def create
    session[:lat] = params['lat']
    session[:lng] = params['lng']
    session[:street_address] = params['address']
    session[:zip] = params['zip']
    @request = Request.new
    render '/rodents/form'
  end

  def form
  end


  def update
    rodent_params = {
      "service_code"=> "4fd3b9bce750846c5300004a",
      "service_name"=>"Rodent Baiting / Rat Complaint",
      'description'=> params[:description],
      'address'=> session[:street_address] +
        ", Chicago, IL, " + session[:zip],
      'lat'=> session[:lat],
      'long'=> session[:lng],
      'attribute[DOYOUWAN]'=> params[:backyard_inspected],
      'attribute[DOYOUWA1]'=> params[:backyard_baited],
      'first_name' => params[:first_name],
      'last_name' => params[:last_name],
      'email' => params[:email],
      'phone' => params[:phone]
    }
    @errors = Rodent.city_params_missing(rodent_params)
    request = Request.new.party_time(rodent_params.merge({street_address: session[:street_address],
      zip_code: session[:zip]}))
    token = request[0]['token']
    @errors.push("Request not accepted by city") if token.nil?
    if @errors.length > 0
      render '/rodents/form'
    end
    redirect_to controller: 'requests', action: 'create', token: token
  end
end
