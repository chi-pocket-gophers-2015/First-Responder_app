class Graffiti < ActiveRecord::Base

  GRAFFITI_LOCATION_OPTIONS = [nil,'Alley', 'Bench', 'Door', 'Dumpster', 'Express Way Job', 'Fence', 'Front', 'Garage', 'Garbage Cart', 'Hydrant', 'Mailbox',
  'Newspaper Box', 'Phone', 'Pole', 'Rear', 'Side', 'Sign', 'Traffic Control Box']

  GRAFFITI_SURFACE_OPTIONS = [nil,'Aluminum Siding', 'Asphalt', 'Brick - Painted', 'Brick - Unpainted', 'Cement (Sidewalk, Alley, Wall, or Curb)', 'Glass', 'Limestone',
  'Marble/Granite','Metal - Painted', 'Metal - Unpainted', 'Other/Unknown Surface', 'Stucco', 'Tree', 'Vinyl Siding', 'Wood - Painted',
  'Wood - Unpainted']

  GRAFFITI_HEIGHT_OPTIONS = [nil, 'Over 6 ft', 'No']

  CITY_REQUIRED = {
    'service_code'=>"Service Code",
    'service_name'=>"Service Name",
    'address'=>'Address',
    'lat'=>'Latitude',
    'long'=>'Longitude',
    'attribute[WHEREIS1]'=>"Where is it located?",
    'attribute[WHATTYP2]'=>"What type of surface is it on?",
    'attribute[OVER6FEE]'=>"Is the graffiti 6 feet from the ground?"}

  def self.city_params_missing(params)
    errors = []
    CITY_REQUIRED.each do |k,v|
      next if !params[k].nil?
      errors.push("Missing field: #{v}")
    end
    return errors
  end

end

