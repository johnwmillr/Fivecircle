class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :authentication_keys => [:username]
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

end