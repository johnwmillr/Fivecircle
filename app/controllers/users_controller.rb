class UsersController < ApplicationController

    def user_params
        params.require(:user).permit(:email, :lastAddress, :latitude, :longitude)
    end

    #before_action :authenticate_user!

    def show
        if current_user
            @user = current_user
        else
            redirect_to root_path
        end
    end
    
    def add_location
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
            show()
        end
        puts "HEYYY"
        
        # result = Pipe.where{ST_Distance(
        #   ST_Transform(location,26986),
        #   ST_Transform(ST_GeomFromText("POINT(#{lat} #{lon})", 4326), 26986)) < 500}.count   
        # rez = {"near" => result}
        # respond_to do |format|
        # format.html
        # format.json { render json: rez }  # respond with the created JSON object

    end
    
    def update_loc
        
    end
end