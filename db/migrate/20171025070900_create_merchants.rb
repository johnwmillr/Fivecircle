class CreateMerchants < ActiveRecord::Migration
  def change
    create_table :merchants, id: false do |t|
      t.primary_key :MerchantId
      t.string :MerchantName
      t.string :Username
      t.string :Email
      t.string :Password
      t.string :Location

      t.timestamps null: false
    end
  end
end
