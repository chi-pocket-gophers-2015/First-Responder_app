# class RodentReport < Report
#   def self.build(params)
#     rodent_params = {
#       "service_code"=> "4fd3b9bce750846c5300004a",
#       "service_name"=>"Rodent Baiting / Rat Complaint",
#       'description' => params[:description],
#       'address' => get_address +
#         ', Chicago, IL, ' + get_zip,
#       'lat' => get_lat,
#       'long' => get_lng,
#       'attribute[DOYOUWAN]'=> params[:backyard_inspected],
#       'attribute[DOYOUWA1]'=> params[:backyard_baited],
#       'first_name' => params[:first_name],
#       'last_name' => params[:last_name],
#       'email' => params[:email],
#       'phone' => params[:phone]
#     }

#   end
# end
