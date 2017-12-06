class UsersController < ApplicationController
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
    
    def add_location
    end
    
    def update_chekin

        lat = params['coordinates']['lat']
        lon = params['coordinates']['lon']
        result = Pipe.where{ST_Distance(
          ST_Transform(location,26986),
          ST_Transform(ST_GeomFromText("POINT(#{lat} #{lon})", 4326), 26986)) < 500}.count   
        rez = {"near" => result}
        respond_to do |format|
        format.html
        format.json { render json: rez }  # respond with the created JSON object

        end
    end
end