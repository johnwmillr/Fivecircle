class SavedCoupon < ActiveRecord::Base
    belongs_to :users
    belongs_to :coupons
end
