class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :set_media, :set_coupons

  # TODO: Figure out the proper way to make @media and @coupons accessible
  # This is almost certainly a kludge...
  # I need @media to be accessible by users_controller.rb
  def set_media
    if current_user
      @media = Medium.where(user_id: current_user[:id])
    end
  end

  # Here's another kludge...
  def set_coupons
    if current_merchant
      @coupons = Coupon.where(merchant_id: current_merchant[:id])
    end
  end
    
  protected

  def devise_parameter_sanitizer
    if resource_class == User
      User::ParameterSanitizer.new(User, :user, params)
      
    elsif resource_class == Merchant
      Merchant::ParameterSanitizer.new(Merchant, :merchant, params)
      
    else
      super # Use the default one
    end
  end
  

  # before_filter :set_google_maps_javascript_api_key

  # def set_google_maps_javascript_api_key
  #   # Load the google maps javascript API key
  #   file_lines = []
  #   File.open('secrets.txt','ar') do |f|
  #       f.each_line {|line| file_lines = file_lines + [line.split(':')[1].strip()]}
  #   end
  #   @javascript_maps_api_key = file_lines[2]
  # end
end
