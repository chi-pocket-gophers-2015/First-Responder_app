class RequestsController < ApplicationController

  # def index
  #   @requests = Request.paginate(:page => params[:page], :per_page => 30)
  # end

  def new
    session.clear
    # binding.pry
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
      @request.update(token: token)
      redirect_to request_path(@request)
      clear_address_sessions
    end
  end

  def index
    @requests = Request.all.order(creation_date: :desc).paginate(page: params[:page], per_page: 5)
  end

  def show
    @show = true
    @request = Request.find_by_id(params[:id])
    token = @request.token
    service_id = Request.official_city_data(token)['service_request_id']
    @request.update(service_request_number: service_id)
    @record = RequestRecord.find_by_token(token)
    @record.update(service_id: service_id)
  end

  private

  def request_params
    params.require(:request).permit(:creation_date, :status, :completion_date,
      :service_request_number, :type_of_service_request, :street_address,
      :zip_code, :latitude, :longitude, :location)
  end

end
