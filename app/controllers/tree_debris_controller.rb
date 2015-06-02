class TreeDebrisController < ApplicationController
  def new
    @category = 'tree_debris'
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
    tree_debris_params = {
      "service_code"=> "4fd3bbf8e750846c53000069",
      "service_name" => "Tree Debris",
      'description' => params[:description],
      'address' => get_address +
        ', Chicago, IL, ' + get_zip,
      'lat' => get_lat,
      'long' => get_lng,
      'attribute[ISTHEAMO]' => params[:debris_size],
      'attribute[IFYES,WH]' => params[:debris_location],
      'first_name' => params[:first_name],
      'last_name' => params[:last_name],
      'email' => params[:email],
      'phone' => params[:phone],
      'media_url' => record.image.url
    }
    @errors = TreeDebris.city_params_missing(tree_debris_params)
    request = Request.new.party_time(tree_debris_params.merge({street_address: get_address, zip_code: get_zip}))
    token = request[0]['token']
    @errors.push("Request not accepted by city") if token.nil?
    if @errors.length > 0
      render '/tree_debris/form' and return
    end
    record.update(token: token)
    redirect_to controller: 'requests', action: 'create', token: token, record_id: record.id
  end

end
