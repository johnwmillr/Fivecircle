class AddMerchantToCoupon < ActiveRecord::Migration
  def change
    add_reference :coupons, :merchant, index: true, foreign_key: true
  end
end
