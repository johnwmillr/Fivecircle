require 'google_maps_service'

class UsersController < ApplicationController
  #before_action :authenticate_user!
  
  def user_params
    params.require(:user).permit(:email, :lastAddress, :latitude, :longitude)
  end
  
  def show
    if current_user
      @user = current_user
    else
      redirect_to root_path
    end
  end

  def on_heroku?
    # Checks if app is running on Heroku
    # (used for Google Maps environment variables for API key)
    ENV['ON_HEROKU']
  end

    #before_action :authenticate_user!

    def show
      if current_user
        @user = current_user
      else
        redirect_to root_path

      end
    end
    
    def reverse_geocode(latlong)
      puts("REVERSE GEOCODE")
      latlong = [41.660214,-91.5343671]  # Pancheros
      # Load the API key
      if on_heroku?
        api_key = ENV['GOOGLE_MAPS_KEY']
      else
        file_lines = []
        File.open('../secrets.txt','r') do |f|
          f.each_line {|line| file_lines = file_lines + [line.split(':')[1].strip()]}
          api_key = file_lines[0]
        end
      end
      
      # Initialize the Geocoding API
      gmaps = GoogleMapsService::Client.new(key: api_key)

      # Reverse geocode the coordinates into a street address
      results = gmaps.reverse_geocode(latlong)

      # Just take the first result
      address = results[0][:formatted_address]

      # Store the address in the database
      if current_user
        current_user.update(lastAddress: address)
      end
      return address
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
    # This method is on John's explore-google-maps branch               
    # user_address = reverse_geocode([lat,lon])
    user_address = "Seamans Center"
    match_merchant = Merchant.where("address == '#{user_address}'")
    puts match_merchant.inspect
    puts (match_merchant.any?).inspect
    if match_merchant.any?
      #match_merchant_id = match_merchant[0][:id]
      coupons_avail = match_merchant[0].coupons
      puts coupons_avail
    else
      flash[:warning] = "You are not in a registered place. Are you in a corn field?"
      redirect_to root_path
      return
    end                    
  end

end    