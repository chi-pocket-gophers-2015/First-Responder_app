# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Rails.application.load_tasks

require 'csv'
require 'json'
require 'open-uri'

# Code for pushing CSV to the DB
# namespace :import_request do
#   task :create_request => :environment do
#     csv_text = File.read('db/rows.csv')
#     csv = CSV.parse(csv_text, :headers => true)
#     csv.each do |row|

#       this = row.to_hash
#       hash = {this["creation_date"], this["status"], this["latitude"], this["longitude"], this["location"]}
#       binding.pry
#       Request.create!(hash)
#     end
#   end
# end

BASE_URL = 'https://data.cityofchicago.org/api/views/'
JSON_SUFFIX = '/rows.json'
BASE_RECENT = 'http://311api.cityofchicago.org/open311/v2/requests.json?start_date='
# @last_time = @last_time || 2015-05-30T00:00:00Z. not sure if this works

extension_hash = {
 potholes: '7as2-ds3y',
 graffiti: 'hec5-y4x5',
 rodent_baiting: '97t6-zrhs',
 street_light_single: '3aav-uy2v',
 tree_trim: 'uxic-zsuj',
 tree_debris: 'mab8-y9h3',
 abandoned_vehicle: '3c9v-pnva'
 # alley_light: 't28b-ys7j',
 # street_light_all: 'zuxi-7xem',
 # traffic_light: 'vfmv-4fbs',
}

#Pull the below method into a separate file
def json_parse(url, header_type)

 raw_data = open(url)
 parsed = JSON.parse(raw_data.read)
 columns = parsed['meta']['view']['columns']
 if header_type == 1
   headers = columns.map{|column| column['name']}
 ########################
 # for potholes:
 elsif header_type == 2
  headers = ["sid","id","position","created_at","created_meta","updated_at","updated_meta","meta","Creation Date","Status","Completion Date","Service Request Number","Type of Service Request","CURRENT ACTIVITY","MOST RECENT ACTION","NUMBER OF POTHOLES FILLED ON BLOCK","Street Address","ZIP Code","X COORDINATE","Y COORDINATE","Ward","Police District","Community Area","SSA","Latitude","Longitude", "Location"]
 end
 # binding.pry
 data = parsed['data']
 # sliced_hash_holder = []

 data[0..99].each do |row|
   data_hash = Hash[headers.zip(row)]
   slice_hash = data_hash.slice("Creation Date", "Status", "Completion Date", "Service Request Number", "Type of Service Request", "Street Address", "ZIP Code", "Latitude", "Longitude", "Location")
   # p slice_hash
   Request.create(slice_hash)
   # sliced_hash_holder << slice_hash
   # binding.pry
 end
 # 100.times do |i|
 #    Request.create(sliced_hash_holder[i])
 # end
end

def get_recent(url, time)

  raw_data = open(url)
  parsed = JSON.parse(raw_data.read)
  slice_hash = data_hash.slice("Creation Date", "Status", "Completion Date", "Service Request Number", "Type of Service Request", "Street Address", "ZIP Code", "Latitude", "Longitude", "Location")
  #need to fix the above line but the idea is the same
  Request.create(slice_hash)
  @last_time = time
end

# def last_time
#   @last_time
# end

# "http://311api.cityofchicago.org/open311/v2/requests.json?start_date=2011-05-25&end_date=2011-05-30"

namespace :import_request do
  task :create_request => :environment do
    extension_hash.each do |key, val|
      url = BASE_URL + val + JSON_SUFFIX
      # binding.pry
      if key == :potholes
        json_parse(url, 2)
      else
        json_parse(url, 1)
        # p url
        # binding.pry
      end
    end
    # json_parse('https://data.cityofchicago.org/api/views/3c9v-pnva/rows.json',2)
  end
  task :create_recent => :environment do
    #variable for time/now
    url = BASE_RECENT + @last_time.strftime("%FT%T%:z") + "&" + Time.now.strftime("%FT%T%:z")
    get_recent(url, Time.now)
  end
end

















