class CreateCoupons < ActiveRecord::Migration
  def change
    create_table :coupons, id: false do |t|
      t.primary_key :CouponId
      t.integer :MerchantId
      t.string :CouponName
      t.string :Description

      t.timestamps null: false
    end
  end
end
