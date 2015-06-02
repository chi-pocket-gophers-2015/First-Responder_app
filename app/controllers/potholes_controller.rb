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
    @record = RequestRecord.last
    render '/potholes/form'
  end

  def form
  end

  def update
    #need to add in control flow for if user is signed in and assign to the record below
    record = RequestRecord.create(token: token, image: params['image'])
    #need to find out what the route is for pic on heroku
    #Sample url below
    #View image <%= image_tag(@record.image.url(:thumb)) %>
    #/system/request_records/images/000/000/003/original/Laina.jpeg?1433185787
    pothole_params = {
      "service_code"=> "4fd3b656e750846c53000004",
      "service_name"=> "Pothole in Street",
      'description'=> params[:description],
      'address'=> session[:street_address] +
        ", Chicago, IL, " + session[:zip],
      'lat'=> session[:lat],
      'long'=> session[:lng],
      'attribute[WHEREIST]'=> params[:where_located],
      'first_name' => params[:first_name],
      'last_name' => params[:last_name],
      'email' => params[:email],
      'phone' => params[:phone]
    }
    @errors = Pothole.city_params_missing(pothole_params)
    request = Request.new.party_time(pothole_params.merge({street_address: session[:street_address],
      zip_code: session[:zip]}))
    token = request[0]['token']
    @errors.push("Request not accepted by city") if token.nil?
    binding.pry
    if @errors.length > 0
      render '/potholes/form' and return
    end
    redirect_to controller: 'requests', action: 'create', token: token
  end

end
