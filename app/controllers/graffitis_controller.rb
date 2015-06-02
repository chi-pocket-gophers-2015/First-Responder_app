class GraffitisController < ApplicationController
  def new
    @category = 'graffitis'
  end

  def create
    set_lat_and_lng(params['lat'], params['lng'])
    set_address_and_zip(params['address'], params['zip'])
    @request = Request.new
    head 200
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
    graffiti_params = {
      "service_code"=> "4fd3b167e750846744000005",
      "service_name"=> "Graffiti Removal",
      'description' => params[:description],
      'address' => get_address +
        ', Chicago, IL, ' + get_zip,
      'lat' => get_lat,
      'long' => get_lng,
      'attribute[WHEREIS1]'=> params[:where_located],
      'attribute[WHATTYP2]'=> params[:surface_type],
      'attribute[OVER6FEE]'=> params[:height],
      'first_name' => params[:first_name],
      'last_name' => params[:last_name],
      'email' => params[:email],
      'phone' => params[:phone],
      'media_url' => record.image.url
    }
    @errors = Graffiti.city_params_missing(graffiti_params)
    request = Request.new.party_time(graffiti_params.merge({street_address: get_address, zip_code: get_zip}))
    token = request[0]['token']
    @errors.push("Request not accepted by city") if token.nil?
    if @errors.length > 0
      render '/graffitis/form' and return
    end
    record.update(token: token)
    redirect_to controller: 'requests', action: 'create', token: token, record_id: record.id
  end
end
