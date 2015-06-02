class PotholesController < ApplicationController
  def new
    @category = 'potholes'
  end

  def create
    set_lat_and_lng(params['lat'], params['lng'])
    set_address_and_zip(params['address'], params['zip'])
    @request = Request.new
    @record = RequestRecord.last
    render '/potholes/form'
  end

  def form
  end

  def update
    if logged_in?
      user = User.find_by_id(current_user.id)
      record = user.request_records.create(image: params['image'])
    else
      record = RequestRecord.create(image: params['image'])
    end
    #need to find out what the route is for pic on heroku
    #Sample url below
    #View image <%= image_tag(@record.image.url(:thumb)) %>
    #http://responderdbc.s3.amazonaws.com/request_records/images/000/000/010/original/jgl.jpg?1433203891
    pothole_params = {
      'service_code' => '4fd3b656e750846c53000004',
      'service_name' => 'Pothole in Street',
      'description' => params[:description],
      'address' => get_address +
        ', Chicago, IL, ' + get_zip,
      'lat' => get_lat,
      'long' => get_lng,
      'attribute[WHEREIST]'=> params[:where_located],
      'first_name' => params[:first_name],
      'last_name' => params[:last_name],
      'email' => params[:email],
      'phone' => params[:phone]
    }
    @errors = Pothole.city_params_missing(pothole_params)
    request = Request.new.party_time(pothole_params.merge({street_address: get_address, zip_code: get_zip}))
    token = request[0]['token']
    @errors.push("Request not accepted by city") if token.nil?
    if @errors.length > 0
      render '/potholes/form'
    end
    record.update(token: token)
    redirect_to controller: 'requests', action: 'create', token: token, record_id: record.id
  end

end
