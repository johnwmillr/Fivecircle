class User::ParameterSanitizer < Devise::ParameterSanitizer
  def initialize(*)
    super
    permit(:sign_up, keys: [:username, :email, :password, :password_confirmation])
    permit(:sign_in, keys: [:username, :password])
  end
end