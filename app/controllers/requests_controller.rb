class RequestsController < ApplicationController
  def new
    session.clear
    @request = Request.new
  end

  def create
    token = params[:token]
    city_params = Request.official_city_data(token)
    if city_params['address'].nil?
      city_params['address'] = "#{session[:street_address]}, #{session[:zip]}"
    end
    @request = Request.new(Request.filter_params(city_params))
    if @request.save
      redirect_to request_path(@request)
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
