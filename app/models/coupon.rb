class Coupon < ActiveRecord::Base
    belongs_to :merchants
    has_many :saved_coupons
end
