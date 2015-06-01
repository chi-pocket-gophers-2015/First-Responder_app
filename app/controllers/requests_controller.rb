class RequestsController < ApplicationController
  def new
    session.clear
    @request = Request.new
  end

  def create
    token = params[:token]
    city_params = Request.official_city_data(token)
    @request = Request.new(Request.filter_params(city_params))
    if @request.save
      redirect_to request_path(@request)
    end
  end

  def show
    @request = Request.find_by_id(params[:id])
  end

  private

  def request_params
    params.require(:request).permit('Creation Date', 'Status', 'Completion Date',
      'Service Request Number', 'Type of Service Request', 'Street Address',
      'ZIP Code', 'Latitude', 'Longitude', 'Location')
  end

end
