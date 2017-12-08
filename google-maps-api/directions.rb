require 'google_maps_service'

# Load the API key
file_lines = []
File.open('../secrets.txt','r') do |f|
    f.each_line {|line| file_lines = file_lines + [line.split(':')[1].strip()]}
end
api_key = file_lines[1]
raise "Missing API key." unless api_key.is_a? String

# Initialize the Directions API
gmaps = GoogleMapsService::Client.new(key: api_key)
routes = gmaps.directions('1700 S. Main Street, Goshen, IN', '1631 S. Main Street, Goshen, IN')

puts routes[0].inspect