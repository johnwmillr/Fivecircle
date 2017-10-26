class AddCouponToSavedCoupon < ActiveRecord::Migration
  def change
    add_reference :saved_coupons, :coupon, index: true, foreign_key: true
  end
end
