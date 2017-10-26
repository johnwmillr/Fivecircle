class CreateCoupons < ActiveRecord::Migration
  def change
    create_table :coupons do |t|
      t.string :CouponName
      t.string :Description

      t.timestamps null: false
    end
  end
end
