class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users, id: false do |t|
      t.primary_key :UserId
      t.string :Username
      t.string :Email
      t.string :Password
      t.string :CurrentLocation

      t.timestamps null: false
    end
  end
end
