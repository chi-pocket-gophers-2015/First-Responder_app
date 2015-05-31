class RequestsController < ApplicationController
  def new
  end

  def map

  end

  def new_form
    @request = Request.new
  end

  def graffiti_form
    @request = Request.new
  end

  def pothole_form
    @request = Request.find_by_id(session[:request_id])
    render :pothole_form
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

  def create
    @request = Request.create('Latitude' => params['lat'], 'Longitude' => params['lng'], 'Street Address' => params['address'], 'ZIP Code' => params['zip'])
    puts "============="
    p @request.id
    session[:request_id] = @request.id
    redirect_to(requests_pothole_form_path)
    #render :pothole_form#, layout: false

  end

  def update
    # @request(params).party_time(params)
  end

  private

   def request_params
    params.permit('Latitude', 'Longitude', 'Street Address')
  end
end
