class User < ActiveRecord::Base
    has_many :media
    has_many :saved_coupons
    has_many :friendships
end
