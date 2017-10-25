class CreateSavedcoupons < ActiveRecord::Migration
  def change
    create_table :savedcoupons, id: false do |t|
      t.primary_key :SavedCouponId
      t.integer :CouponId
      t.integer :UserId
      t.boolean :Valid

      t.timestamps null: false
    end
  end
end
