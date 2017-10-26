class CreateSavedCoupons < ActiveRecord::Migration
  def change
    create_table :saved_coupons do |t|
      t.boolean :Valid

      t.timestamps null: false
    end
  end
end
