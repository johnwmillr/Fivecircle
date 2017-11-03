class User < ActiveRecord::Base
    has_many :media
    has_many :saved_coupons
    has_many :friendships

    # geocoded_by :address do |obj, results|
    #     if geo = results.first              
    #         obj.latitude = geo.latitude
    #         obj.longitude = geo.longitude
    #     end
    # end
    # after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }


end