class Pothole < ActiveRecord::Base

  POTHOLE_LOCATION_OPTIONS = ['Crosswalk', 'Curb Lane', 'Intersection', 'Traffic Lane']

  CITY_REQUIRED = {
    'service_code'=>"Service Code",
    'service_name'=>"Service Name",
    'address'=>'Address',
    'lat'=>'Latitude',
    'long'=>'Longitude',
    'attribute[WHEREIST]'=>"Where is the pothole located?"
    }

  def self.city_params_missing(params)
    errors = []
    CITY_REQUIRED.each do |k,v|
      next if !params[k].nil?
      errors.push("Missing field: #{v}")
    end
    return errors
  end

end

