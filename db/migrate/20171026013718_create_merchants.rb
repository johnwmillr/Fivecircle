class CreateMerchants < ActiveRecord::Migration
  def change
    create_table :merchants do |t|
      t.string :MerchantName
      t.string :Username
      t.string :Email
      t.string :Password
      t.string :Location

      t.timestamps null: false
    end
  end
end
