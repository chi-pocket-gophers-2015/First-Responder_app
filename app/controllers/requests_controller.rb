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

  def create
    if request.xhr?
      @request = Request.create('Latitude' => params['lat'], 'Longitude' => params['lng'], 'Street Address' => params['address'], 'ZIP Code' => params['zip'])
      puts "============="
      p @request.id
      # redirect_to(requests_pothole_form_path)
      render :pothole_form, layout: false
    else
      # p @request
      puts '~~~~~~~~~~~~~~'
      p params
    end
    # request = Request.new
    # request.party_time
    # p request
  end

  private

   def request_params
    params.permit('Latitude', 'Longitude', 'Street Address')
  end
end
