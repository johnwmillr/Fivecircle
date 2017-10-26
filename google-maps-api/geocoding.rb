require 'google_maps_service'

# Load the API key
file_lines = []
File.open('../secrets.txt','r') do |f|
    f.each_line {|line| file_lines = file_lines + [line.split(':')[1].strip()]}
end
api_key_geocoding = file_lines[0]

# Initialize the Geocoding API
gmaps_geocoding = GoogleMapsService::Client.new(key: api_key_geocoding)

# Do some reverse geocoding
latlong = [41.6609926,-91.5359006] # Pentacrest
latlong = [41.6596182,-91.5369034] # Seamans Center
latlong = [41.660214,-91.5343671] # Pancheros
results = gmaps.reverse_geocode(latlng)

puts '********************'
results.each do |r|
    puts '-----------'
    puts r[:formatted_address].inspect
end

