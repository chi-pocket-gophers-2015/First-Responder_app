require File.expand_path('../config/application', __FILE__)

Rails.application.load_tasks

require 'csv'
require 'json'
require 'open-uri'
require 'active_support'
require 'net/http'

namespace :scheduled_rake do
  desc "Ping heroku daily to seed with 311 data"
  task :big do
    puts "Making the attempt to make large request"

    if ENV['URL']
      puts "Sending ping"

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

      puts "success..."
    end
  end

  task :create_recent => :environment do
    hour_ago = DateTime.now - (1/24.0)
    url = BASE_RECENT + hour_ago.strftime("%FT%T%:z") + "&" + Time.now.strftime("%FT%T%:z")
    get_recent(url)
  end
end