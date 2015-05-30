class Request < ActiveRecord::Base

  include HTTParty

  attr_reader :options
  base_uri 'http://test311api.cityofchicago.org'

  def party_time()
    @options = {service_code: '4fd3b656e750846c53000004',
                'description' => 'hedssdflo',
                "address" => "295 W COYLE AVE, CHICAGO, IL, 60645",
                "lat" => 41.00749494401174,
               "long" => -94.70276666645528,
               'attribute[WHEREIST]' => 'Crosswalk'}
    self.class.post("/open311/v2/requests.json", query: @options, headers: {'api_key' => ENV['API_KEY']})

  end

  # def test
  #   self.class.post("/open311/v2/requests.json", query: @options, headers: {'api_key' => 'b6efeac2fae7c79b3258b82f2ed82eab'})
  # end

end
