class RequestsController < ApplicationController
  def new
    session.clear
    @request = Request.new
  end

  def create
    @request = Request.new(request_params)
    if @request.save
      render :success
    end
  end

  private

  def request_params
    params.require(:request).permit('Creation Date', 'Status', 'Completion Date',
      'Service Request Number', 'Type of Service Request', 'Street Address',
      'ZIP Code', 'Latitude', 'Longitude', 'Location')
  end

end
