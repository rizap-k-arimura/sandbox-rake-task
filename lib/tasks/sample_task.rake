require 'uri'
require 'net/http'

namespace :sample_task do
    desc "Sample Task"
    task :sample do
        puts "Hello #{ENV['SERVICE_CONNEXT_URL']}"
        uri = URI(ENV['SERVICE_CONNEXT_URL'])
        res = Net::HTTP.get_response(uri)
        puts res.body if res.is_a?(Net::HTTPSuccess)  
    end
end
