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
    request = Request.new
    request.party_time
    request.test
    p request
  end

  private

   def request_params

  end
end
