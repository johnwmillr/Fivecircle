class CreateCoupons < ActiveRecord::Migration
  def change
    create_table :coupons do |t|
      t.string :couponName
      t.string :description

      t.timestamps null: false
    end
  end
end
