class CreateSavedCoupons < ActiveRecord::Migration
  def change
    create_table :saved_coupons do |t|
      t.boolean :validation

      t.timestamps null: false
    end
  end
end
