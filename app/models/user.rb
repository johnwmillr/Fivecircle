class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :authentication_keys => [:username]
         
  devise :omniauthable, :omniauth_providers => [:facebook]
  
  has_many :media
  has_many :saved_coupons
  has_many :friendships
  
  # before_create :add_created_at
  # before_create :add_updated_at
  # private
  #   def add_created_at
  #     self.created_at= Time.now
  #   end
  # private
  #   def add_updated_at
  #     self.updated_at = Time.now
  #   end

  # Example code for using Geocoder for addresses and lat/long conversion
  # geocoded_by :address do |obj, results|
  #     if geo = results.first              
  #         obj.latitude = geo.latitude
  #         obj.longitude = geo.longitude
  #     end
  # end
  # after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }
  
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.username = auth.info.name   # assuming the user model has a name
      #user.image = auth.info.image # assuming the user model has an image
      # If you are using confirmable and the provider(s) you use validate emails, 
      # uncomment the line below to skip the confirmation emails.
      # user.skip_confirmation!
    end
  end
  
  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

end