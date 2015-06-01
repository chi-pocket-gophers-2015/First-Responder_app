class StreetLightsController < RequestsController
  def new
    @category = 'street_lights'
  end

  def create
    set_lat_and_lng(params['lat'], params['lng'])
    set_address_and_zip(params['address'], params['zip'])
    @request = Request.new
    render '/street_lights/form'
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
    #/system/request_records/images/000/000/003/original/Laina.jpeg?1433185787
    street_light_params = {
      "service_code"=> "4ffa9f2d6018277d400000c8",
      "service_name"=> "Street Light Out",
      'description' => params[:description],
      'address' => get_address +
        ', Chicago, IL, ' + get_zip,
      'lat' => get_lat,
      'long' => get_lng,
      'attribute[ISTHELI2]'=> params[:light_status],
      'first_name' => params[:first_name],
      'last_name' => params[:last_name],
      'email' => params[:email],
      'phone' => params[:phone]
    }
    request = Request.new.party_time(street_light_params.merge({street_address: get_address, zip_code: get_zip}))
    token = request[0]['token']
    record.update(token: token)
    redirect_to controller: 'requests', action: 'create', token: token, record_id: record.id
  end
end
