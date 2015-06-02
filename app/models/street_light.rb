class StreetLight < ActiveRecord::Base

  STREET_LIGHT_OUT_OPTIONS = [nil,"Completely Out", "On and Off"]

  CITY_REQUIRED = {
    'service_code'=>"Service Code",
    'service_name'=>"Service Name",
    'address'=>'Address',
    'lat'=>'Latitude',
    'long'=>'Longitude',
    'attribute[ISTHELI2]'=>"Is the light completely out or does it go on and off?"
    }

  def self.city_params_missing(params)
    errors = []
    CITY_REQUIRED.each do |k,v|
      next if params[k] != ""
      errors.push("Missing field: #{v}")
    end
    return errors
  end

end

