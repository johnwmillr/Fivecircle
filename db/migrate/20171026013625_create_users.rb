class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :Username
      t.string :Email
      t.string :Password
      t.string :LastLocation

      t.timestamps null: false
    end
  end
end
