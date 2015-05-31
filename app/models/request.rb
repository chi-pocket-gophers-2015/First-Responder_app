class Request < ActiveRecord::Base


  VEHICLE_MAKE_MODEL_OPTIONS = ["(Assembled From Parts, Homemade)","(Homemade Motorcycle, Moped.Etc)","(Homemade Trailer)","(Reconstructed Motor Home)",
    "(Reconstructed Trailers)","See Lancia Make)", "(Unlisted Construction Equipment Make)","(Unlisted Farm/Garden Equipment Make)","(Unlisted Make)",
    "(Unlisted Manufacturer)","Acura","Aero Glass Boat Co.","Alfa Romeo", "All Terrain - No Vmo", "American Motors", "Audi", "Austin", "Bentley", "Bmw", "Buick",
    "Cadillac", "Campers, Inc.", "Caterpillar Tractor Co.", "Chappy (Mfd. By Yamaha Motor Corp.)", "Chevrolet", "Chrysler", "Cozy Craft (Mfd. By Travelcraft, Inc.)",
    "Craftsmam", "Daewoo", "Daimler", "Datsun","Deere, John; Deere &amp; Co.","Dodge","Doolittle", "Dune Buggy Open Body", "Engine", "Factory Outlet Trailers", "Fiat",
    "Ford", "Freightliner Corp.", "Fruehauf Corp", "General Motors Corp.", "Geo/Metro", "Geo/Prism", "Geo/Storm", "Geo/Truck(Tracker)", "Go Kart", "Golf Cart Open Body",
    "Golf Or Go Cart Or Dune Buggy", "Great Dane Trailers Inc.", "Halliburton Co.", "Harley-Davidson", "Honda", "Humbee Surrey", "Husqvarna", "Hyundai", "Infiniti/M30",
    "Infiniti/Q45", "International Harvester", "Isuzu", "Jaguar", "Jayco, Inc.", "Jeep (If Mfd. Prior To 1970)", "Jeep - Year Greater 1988", "Jeep/Cherokee",
    "Karmann-Ghia (Vma Was Karg)", "Kawasaki Motors Corp.", "Kenworth Motor Truck Co.", "Kia Motors Corp", "Lamborghini/Countach", "Lamborghini/Espada", "Lamborghini/Jalpa",
    "Lamborghini/Jarma", "Lamborghini/Miura Sv", "Land Rover", "Legacy Unknown", "Lexus", "Lincoln", "Low Boy Trailer", "Mack Trucks, Inc.", "Maserati", "Mazda",
    "Mercedes", "Mercury", "Merkur", "Mg/Midget", "Mitsubishi", "Mobile Home Co.", "Monon Trailer, Div. Of Evans Products Co.", "Nash", "Nimrod Travel Trailer",
    "Nissan", "Oldsmobile", "Opel", "Packard", "Peterbilt Motors Co., Division Paccar, Inc.", "Peugeot", "Plymouth", "Pontiac", "Porsche", "Rambler", "Range Rover of North America",
    "Reconstructed", "Renault", "Renault/Alliance", "Rolls Royce", "Saab", "Saturn", "Seagull", "Snowmobile - No Vmo", "Starcraft Corp.", "Stoughton Trailers, Inc.",
    "Studebaker", "Subaru", "Suzuki", "Tennesse Trailer", "Toyota", "Trailco Mfg. Sales Co., Div. Of Dorsey Trailers", "Transcraft Corp.", "Transmission - No Vmo",
    "Triumph", "U-Haul Co, Division Parkhurst Manufacturing Co.", "Vehicle Part", "Vespa", "Volkswagen", "Volvo", "Wasp", "Winnebago Industries, Inc.", "Zcz (Yugoslavia)"]

  VEHICLE_COLOR_OPTIONS = ["Beige", "Black", "Blue", "Bronze", "Brown", "Burgundy", "Chrome", "Copper", "Cream", "Gold", "Gray", "Green", "Maroon", "Multi-Color",
    "Orange", "Pink", "Purple", "Red", "Silver", "Star", "Stripes", "Tan", "Turquoise", "Unknown", "White", "Yellow"]

  VEHICLE_BODY_STYLE_OPTIONS = ["Ambulance", "Bus", "Carryall", "Coach", "Dump Truck", "Fire Truck", "Flatbed Truck", "Garage Truck", "Hatchback 2 Door", "Hatchback 4 Door",
    "Legacy Unknown", "Limousine", "Motor Bike"]

	validates "Service Request Number", :presence => true, :uniqueness => true

  private

  include HTTParty

  attr_reader :options
  base_uri 'http://test311api.cityofchicago.org'

  def party_time()
    @options = {service_code: '4fd3b656e750846c53000004',
                'description' => 'Hello George',
                "address" => "295 W COYLE AVE, CHICAGO, IL, 60645",
                "lat" => 41.00749494401174,
               "long" => -34.70276666645528,
               'attribute[WHEREIST]' => 'Crosswalk'}
    self.class.post("/open311/v2/requests.json", query: @options, headers: {'api_key' => ENV['API_KEY']})

  end
  # go here to see test post:
  #http://dev.cityofchicago.org/docs/api/service_request
  # HTTParty.get('http://test311api.cityofchicago.org/open311/v2/requests/#{serviceID}.json')

  # def test
  #   self.class.post("/open311/v2/requests.json", query: @options, headers: {'api_key' => 'b6efeac2fae7c79b3258b82f2ed82eab'})
  # end

end


