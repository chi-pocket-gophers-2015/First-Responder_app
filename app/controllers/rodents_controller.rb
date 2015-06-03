class RodentsController < ApplicationController
  def new
    @category = 'rodents'
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
    rodent_params = {
      "service_code"=> "4fd3b9bce750846c5300004a",
      "service_name"=>"Rodent Baiting / Rat Complaint",
      'description' => params[:description],
      'address' => get_address +
        ', Chicago, IL, ' + get_zip,
      'lat' => get_lat,
      'long' => get_lng,
      'attribute[DOYOUWAN]'=> params[:backyard_inspected],
      'attribute[DOYOUWA1]'=> params[:backyard_baited],
      'first_name' => params[:first_name],
      'last_name' => params[:last_name],
      'email' => params[:email],
      'phone' => params[:phone],
      'media_url' => image_url(record)
    }

    contact_array = ['first_name', 'last_name', 'email', 'phone']
    if params['toggle'] != "on"
      rodent_params.except!(*contact_array)
    end

    @errors = Rodent.city_params_missing(rodent_params)
    request = Request.new.party_time(rodent_params.merge({street_address: get_address, zip_code: get_zip}))
    token = request[0]['token']
    @errors.push("Request not accepted by city") if token.nil?
    if @errors.length > 0
      render '/rodents/form' and return
    end
    record.update(token: token)
    redirect_to controller: 'requests', action: 'create', token: token, record_id: record.id
  end
end
