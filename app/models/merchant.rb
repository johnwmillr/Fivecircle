class Merchant < ActiveRecord::Base
    has_many :coupons
end
