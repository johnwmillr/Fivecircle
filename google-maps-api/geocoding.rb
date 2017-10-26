require 'google_maps_service'

# Setup API keys
file_lines = []
File.open('./secrets.txt','r') do |f|
    f.each_line {|line| file_lines = file_lines + [line.split(':')[1].strip()]}
end
api_key = file_lines[0]


# Initialize the Geocoding API
gmaps = GoogleMapsService::Client.new(key: api_key)
# lat,long = 41.6609926,-91.5359006 # Pentacrest
lat,long = 41.6596182,-91.5369034 # Seamans Center
results = gmaps.reverse_geocode([lat, long])

puts '********************'
results.each do |r|
    puts '-----------'
    puts r[:formatted_address].inspect
end