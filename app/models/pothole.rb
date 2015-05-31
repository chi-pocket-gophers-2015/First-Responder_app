class Pothole < ActiveRecord::Base

def self.submit_request(params)
  Request.part_time(params)
  Request.create(request_params)
end

def self.party_time_params(params)
  return ['where_located']
end

private

def pothole_params

end

end
