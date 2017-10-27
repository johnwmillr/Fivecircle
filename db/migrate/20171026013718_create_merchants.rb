class CreateMerchants < ActiveRecord::Migration
  def change
    create_table :merchants do |t|
      t.string :merchantName
      t.string :username
      t.string :email
      t.string :password_digest
      t.string :location

      t.timestamps null: false
    end
  end
end
