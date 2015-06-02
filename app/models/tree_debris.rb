class TreeDebris < ActiveRecord::Base

  TREE_DEBRIS_SIZE_OPTIONS = [nil,"Yes", "No"]

  TREE_DEBRIS_LOCATION_OPTIONS = [nil,"Alley", "Parkway", "Vacant Lot"]

  CITY_REQUIRED = {
    'service_code'=>"Service Code",
    'service_name'=>"Service Name",
    'address'=>'Address',
    'lat'=>'Latitude',
    'long'=>'Longitude',
    'attribute[ISTHEAMO]'=>"Is the debris larger than a city garbage cart?",
    'attribute[IFYES,WH]'=>"Where is the debris located?"
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

