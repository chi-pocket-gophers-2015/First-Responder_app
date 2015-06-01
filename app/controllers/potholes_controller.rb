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
    if logged_in?
      record = RequestRecord.create(image: params['image'], user_id: current_user.id)
    else
      record = RequestRecord.create(image: params['image'])
    end
    #need to find out what the route is for pic on heroku
    #Sample url below
    #View image <%= image_tag(@record.image.url(:thumb)) %>
    #/system/request_records/images/000/000/003/original/Laina.jpeg?1433185787
    pothole_params = {
      'service_code' => '4fd3b656e750846c53000004',
      'service_name' => 'Pothole in Street',
      'description' => params[:description],
      'address' => session[:street_address] +
        ', Chicago, IL, '' + session[:zip],
      'lat' => session[:lat],
      'long' => session[:lng],
      'attribute[WHEREIST]'=> params[:where_located],
      'first_name' => params[:first_name],
      'last_name' => params[:last_name],
      'email' => params[:email],
      'phone' => params[:phone]
    }
    request = Request.new.party_time(pothole_params.merge({street_address: session[:street_address],
      zip_code: session[:zip]}))
    token = request[0]['token']
    record.update(token: token)
    redirect_to controller: 'requests', action: 'create', token: token
  end

end
