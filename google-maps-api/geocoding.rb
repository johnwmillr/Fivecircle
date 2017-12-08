require 'google_maps_service'

def on_heroku?
  ENV['ON_HEROKU']
end

# Load the API key
if on_heroku?
    api_key = ENV['GOOGLE_MAPS_KEY']
else
    file_lines = []
    File.open('../secrets.txt','r') do |f|
        f.each_line {|line| file_lines = file_lines + [line.split(':')[1].strip()]}
    end
    api_key = file_lines[0]
end

# Initialize the Geocoding API
gmaps = GoogleMapsService::Client.new(key: api_key)

# Do some reverse geocoding
# latlong = [41.6594775,-91.5384874] # Main library
latlong = [41.657228, -91.538326] # CRWC
# latlong = [41.6596202,-91.5368124] # Seamans Center
# latlong = [41.660214,-91.5343671]  # Pancheros
results = gmaps.reverse_geocode(latlong)

puts '********************'
puts 'Lat/Long: ' + latlong.inspect
results.each do |r|
    puts '-----------'
    puts r[:formatted_address].inspect
end

