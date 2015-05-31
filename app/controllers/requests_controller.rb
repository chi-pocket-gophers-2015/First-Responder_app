class RequestsController < ApplicationController
  def new
    session.clear
    @request = Request.new
  end

  def new_form
    session[:category] = params[:category]
    redirect_to(map_requests_path)
  end

  def map
    @category = session[:category]
  end

  def create
    # @request = Request.create('Latitude' => params['lat'],
    #   'Longitude' => params['lng'], 'Street Address' => params['address'],
    #   'ZIP Code' => params['zip'])
    @request = Request.new
    session[:lat] = params['lat']
    session[:lng] = params['lng']
    session[:street_address] = params['street_address']
    session[:zip] = params['zip']
    redirect_to "/requests/#{session[:category]}_form"
  end

  def update
    # request = Request.create(request_params)
    # request.party_time(params)
    # @request(params).party_time(params)
  end



  def graffiti_form
    @request = Request.new
  end

  def pothole_form
    @request = Request.new
  end

  def rodent_form
    @request = Request.new
  end

  def street_light_form
    @request = Request.new
  end

  def tree_debris_form
    @request = Request.new
  end

  def tree_trim_form
    @request = Request.new
  end

  def abandoned_vehicle_form
    @request = Request.new
  end

  private

  def self.request_params
    params.permit('Latitude', 'Longitude', 'Street Address')
  end

end
