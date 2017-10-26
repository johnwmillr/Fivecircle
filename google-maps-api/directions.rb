require 'google_maps_service'

# Load the API key
file_lines = []
File.open('../secrets.txt','r') do |f|
    f.each_line {|line| file_lines = file_lines + [line.split(':')[1].strip()]}
end
api_key_directions = file_lines[1]

# Initialize the Directions API
gmaps_directions = GoogleMapsService::Client.new(key: api_key_directions)
routes = gmaps.directions('1700 S. Main Street, Goshen, IN', '1631 S. Main Street, Goshen, IN')

puts '********************'
puts routes[0].inspect