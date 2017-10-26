class AddUserToSavedCoupon < ActiveRecord::Migration
  def change
    add_reference :saved_coupons, :user, index: true, foreign_key: true
  end
end
