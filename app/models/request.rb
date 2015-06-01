class Request < ActiveRecord::Base

	# validates "Service Request Number", :presence => true, :uniqueness => true

  include HTTParty

  attr_reader :options
  base_uri 'http://test311api.cityofchicago.org'

  def to_s
    output = "#{self.type_of_service_request} - " +
    "#{self.street_address}, Chicago, IL. " +
    "#{self.zip_code}.  " +
    "Created on: " + "#{self.creation_date}.  " +
    "Status: #{self.status}."
    if self.status == "Completed"
      output = output + "  Completion Date: #{self.completion_date}"
    end
    output
  end

  def creation_date=(val)
    write_attribute(:creation_date, val.to_datetime)
  end

  def completion_date=(val)
    if !val.nil?
      write_attribute(:completion_date, val.to_datetime)
    end
  end

  # def zip_code=(val)
  #   write_attribute(:zip_code, val.to_i)
  # end

  def party_time(options)
    self.class.post("/open311/v2/requests.json", query: options, headers: {'api_key' => ENV['API_KEY']})
  end
  # go here to see test post:
  #http://dev.cityofchicago.org/docs/api/service_request
  # HTTParty.get('http://test311api.cityofchicago.org/open311/v2/requests/#{serviceID}.json')

  # def test
  #   self.class.post("/open311/v2/requests.json", query: @options, headers: {'api_key' => 'b6efeac2fae7c79b3258b82f2ed82eab'})
  # end

  def self.official_city_data(token)
    HTTParty.get("http://test311api.cityofchicago.org/open311/v2/requests/#{token}.json")[0]
  end

  def self.filter_params(params)
    return {
      :creation_date => params['updated_datetime'],
      :status => params["status"],
      :completion_date => nil,
      :service_request_number => params["service_request_id"],
      :type_of_service_request => params["service_name"],
      :street_address => params[ "address"],
      :zip_code => nil,
      :latitude => params['lat'],
      :longitude => params['long'],
      :location => nil
    }
  end

end


