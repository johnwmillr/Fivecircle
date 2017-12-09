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
      # Load the API key
      if on_heroku? or 1
        api_key = ENV['GOOGLE_MAPS_KEY']
      else
        file_lines = []
        File.open('../secrets.txt','r') do |f|
          f.each_line {|line| file_lines = file_lines + [line.split(':')[1].strip()]}
          api_key = file_lines[0]
        end
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

    puts '*************************************************'
    puts "Coord: " + [lat,lon].inspect

    # Convert the lat/lon coordinates into an address
    # This method is on John's explore-google-maps branch               
    # user_address = "115 Iowa Ave, Iowa City, IA 52240"
    user_address = reverse_geocode([lat,lon])
    #puts "addr " + user_address.inspect
    match_merchant = Merchant.where("address == '#{user_address}'")
    #puts match_merchant.inspect
    #puts (match_merchant.any?).inspect
    puts '####################################################'
    if match_merchant.any?
      #match_merchant_id = match_merchant[0][:id]
      
      # if coupons_avail.length < 1
      #   flash[:warning] = "No coupons were found at this location"
      #   render :text => "#{current_user[:id]}"
      # else
      render :text => "#{current_user[:id]}/avail_coupons"
      # end
      
    else
      flash[:warning] = "You are not in a registered place. Are you in a corn field?"
      render :text => "#{current_user[:id]}"


    end                    
  end
  
  def getCoupons

    puts current_user.lastAddress
    # user_address = "115 Iowa Ave, Iowa City, IA 52240"
    match_merchant = Merchant.where("address = '#{current_user.lastAddress}'")
    # match_merchant = Merchant.where("address == '#{user_address}'")

    puts match_merchant.inspect
    @coupons_avail = match_merchant[0].coupons
    
  end
  
  def selCoupons
    if params[:coupon_sel] == nil
      flash[:notice] = 'No coupons selected'
    else
      params[:coupon_sel].keys.each {|c| puts "!!!!"
      puts c 
      saveCoupForUser(c)}
      flash[:notice] = 'Coupons added successfully (but not really)'      
    end
    redirect_to user_path(current_user.id)
  end
  
  def saveCoupForUser(coupon_to_save)
    @current_user.saved_coupons.build(:id =>coupon_to_save,:validation => true, :created_at => Coupon.find(coupon_to_save)[:created_at],:updated_at => Coupon.find(coupon_to_save)[:updated_at], :coupon_id => coupon_to_save)
    puts @current_user.saved_coupons.inspect
  end

  def save_location
    @geodata = params['coordinates']
    lat = @geodata["latitude"].to_f
    lon = @geodata["longitude"].to_f

    # Store lat and lon in database
    if current_user
      current_user.update(latitude: lat, longitude: lon)
    end        

  end
end