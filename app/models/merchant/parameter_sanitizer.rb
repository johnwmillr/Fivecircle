class Merchant::ParameterSanitizer < Devise::ParameterSanitizer
  def initialize(*)
    super
    permit(:sign_up, keys: [:username, :merchantName, :email, :address, :password, :password_confirmation])
    permit(:sign_in, keys: [:username, :email, :password])
  end
end