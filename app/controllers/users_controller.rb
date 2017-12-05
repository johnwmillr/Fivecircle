class UsersController < ApplicationController
  #before_action :authenticate_user!
  def show
      if current_user
          @user = current_user
      else
          redirect_to root_path
      end
  end
end