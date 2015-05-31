class Request < ActiveRecord::Base

	validates "Service Request Number", :presence => true, :uniqueness => true


  include HTTParty

  attr_reader :options
  base_uri 'http://test311api.cityofchicago.org'

  def party_time()
    @options = {"service_code"=>"4fd3b656e750846c53000004",
 "description"=>"4",
 "address"=>"351 W Hubbard St, Chicago, IL, 60654",
 "lat"=>"41.8896848",
 "long"=>"-87.63775020000003",
 "attribute[WHEREIST]"=>"Crosswalk"}
    self.class.post("/open311/v2/requests.json", query: @options, headers: {'api_key' => ENV['API_KEY']})
  end
  # go here to see test post:
  #http://dev.cityofchicago.org/docs/api/service_request
  # HTTParty.get('http://test311api.cityofchicago.org/open311/v2/requests/#{serviceID}.json')

  # def test
  #   self.class.post("/open311/v2/requests.json", query: @options, headers: {'api_key' => 'b6efeac2fae7c79b3258b82f2ed82eab'})
  # end

end


