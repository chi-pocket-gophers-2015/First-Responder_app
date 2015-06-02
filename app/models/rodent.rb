class Rodent < ActiveRecord::Base
  RODENT_INSPECTION_OPTIONS = [nil,"Inspect Back Yard", "No"]
  RODENT_BAIT_OPTIONS = [nil,"Bait Back Yard", "No"]

  CITY_REQUIRED = {
    'service_code'=>"Service Code",
    'service_name'=>"Service Name",
    'address'=>'Address',
    'lat'=>'Latitude',
    'long'=>'Longitude',
    'attribute[DOYOUWAN]'=>"Do you want your backyard inspected?",
    'attribute[DOYOUWA1]'=>"Do you want your backyard baited?"
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
