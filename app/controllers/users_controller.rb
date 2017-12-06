require 'google_maps_service'

class UsersController < ApplicationController
  #before_action :authenticate_user!
  def show
      if current_user
          @user = current_user
      else
          redirect_to root_path
      end
  end

  def checkin
    @geodata = params['coordinates']
    lat = @geodata["latitude"].to_f
    lon = @geodata["longitude"].to_f

    # Store lat and lon in database
    if current_user
      current_user.update(latitude: lat, longitude: lon)
    end

    puts '********************'
    puts "Coord: " + [lat,lon].inspect

    # Convert the lat/lon coordinates into an address
    reverse_geocode([lat,lon])
  end

  def reverse_geocode(latlong)
    # Load the API key
    file_lines = []
    File.open('../secrets.txt','r') do |f|
        f.each_line {|line| file_lines = file_lines + [line.split(':')[1].strip()]}
    end
    api_key = file_lines[0]

    # Initialize the Geocoding API
    gmaps = GoogleMapsService::Client.new(key: api_key)

    results = gmaps.reverse_geocode(latlong)

    # Store the first result in the database
    if current_user
      current_user.update(lastAddress: results[0][:formatted_address])
    end
    
    results.each do |r|
        puts '-----------'  
        puts r[:formatted_address].inspect
    end

  end


end