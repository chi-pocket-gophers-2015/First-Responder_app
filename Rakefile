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

extension_hash = {
 potholes: '7as2-ds3y',
 graffiti: 'hec5-y4x5',
 rodent_baiting: '97t6-zrhs',
 alley_light: 't28b-ys7j',
 street_light_single: '3aav-uy2v',
 street_light_all: 'zuxi-7xem',
 traffic_light: 'vfmv-4fbs',
 tree_trim: 'uxic-zsuj',
 tree_debris: 'mab8-y9h3',
 abandoned_vehicle: '3c9v-pnva'
}

def json_parse(url)

 raw_data = open(url)
 parsed = JSON.parse(raw_data.read)
 columns = parsed['meta']['view']['columns']
 # headers = columns.map{ |column| column['name'].gsub(/(\s){1}(the){1}/," The").gsub(/(\s){1}(as){1}/," As").gsub(/(\s){1}(of){1}/," Of").gsub(/\s+/,"").gsub(/\?/,"_").underscore }
 headers = columns.map{|column| column['name']}
 # binding.pry
 data = parsed['data']
 data.each do |row|
   data_hash = Hash[headers.zip(row)]
   e
   slice_hash = data_hash.slice("Creation Date", "Status", "Completion Date", "Service Request Number", "Type of Service Request", "Street Address", "ZIP Code", "Latitude", "Longitude", "Location")
   binding.pry
   Request.create(slice_hash)
          # :"Type of Service Request", :"Street Address", :"ZIP Code", :latitude, :longitude, :location))

 end
end

namespace :import_request do
  task :create_request => :environment do
    extension_hash.each do |key, val|
      url = BASE_URL + val + JSON_SUFFIX
      json_parse(url)
    end

    # json_parse('https://data.cityofchicago.org/api/views/3c9v-pnva/rows.json')
  end
end

















