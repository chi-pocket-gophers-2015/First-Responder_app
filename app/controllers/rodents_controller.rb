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
      'attribute[DOYOUWA1]'=> params[:backyard_baited]
    }
    request = Request.new.party_time(rodent_params)
    binding.pry
    # params = params.merge{'lat': session['lat'], blah blah}
    # HTTParty(pothole_params)
    # Request.new(params)
    # render '/requests/success'
  end
end
