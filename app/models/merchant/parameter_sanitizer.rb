class Merchant::ParameterSanitizer < Devise::ParameterSanitizer
  def initialize(*)
    super
    permit(:sign_up, keys: [:m_id, :merchantName, :email, :address, :password, :password_confirmation])
    permit(:sign_in, keys: [:m_id, :password])
  end
end