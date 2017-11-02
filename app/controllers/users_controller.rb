class UsersController < ApplicationController
  before_filter :set_current_user, :only=> ['show', 'edit', 'update', 'delete']
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
  def show
    # @user = User.find(params[:id])
    @user = @current_user
  end

  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Sign up successful! Welcome to Rotten Potatoes"
      redirect_to login_path
    else
      render 'new'
    end  
  end  
  
end