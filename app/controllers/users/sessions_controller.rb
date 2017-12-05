class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    user = User.find_by_username(params[:user][:username])
    if user && user.valid_password?(params[:user][:password])
      if !current_merchant
        #sign in and redirect to show page
        super
      else
        flash[:warning] = 'logout merchant first to login user'
        redirect_to root_path
      end
      
    else
      flash[:warning] = 'Invalid email/password combination'
      render 'new'
    end  
    
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
