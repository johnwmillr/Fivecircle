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
end