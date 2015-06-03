class RequestsController < ApplicationController

  def index
    @requests = Request.all
  end

  def new
    session.clear
    @request = Request.new
  end

  def map
    @requests = Request.all
    @vehicles = Request.where(type_of_service_request: "Abandoned Vehicle Complaint")
    @graffitis = Request.where(type_of_service_request: "Graffiti Removal")
    @potholes = Request.where(type_of_service_request: "Pothole in Street")
    @rodents = Request.where(type_of_service_request: "Rodent Baiting/Rat Complaint")
    @lights = Request.where(type_of_service_request: "Street Light Out")
    @trees = Request.where(type_of_service_request: "Tree Debris")
  end

  def create
    token = params[:token]
    record = RequestRecord.find_by_id(params[:record_id])
    record.update(service_id: params["service_request_id"])
    city_params = Request.official_city_data(token)
    if city_params['address'].nil?
      city_params['address'] = "#{get_address}, #{get_zip}"
    end
    @request = Request.new(Request.filter_params(city_params))
    if @request.save
      redirect_to request_path(@request)
      clear_address_sessions
    end
  end

  def index
    @requests = Request.all.order(creation_date: :desc)
  end

  def show
    @request = Request.find_by_id(params[:id])
  end

  private

  def request_params
    params.require(:request).permit(:creation_date, :status, :completion_date,
      :service_request_number, :type_of_service_request, :street_address,
      :zip_code, :latitude, :longitude, :location)
  end

end
