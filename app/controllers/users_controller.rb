class UsersController < ApplicationController
    #before_action :authenticate_user!
    def show
        if current_user
            @user = current_user
        else
            redirect_to root_path
        end
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