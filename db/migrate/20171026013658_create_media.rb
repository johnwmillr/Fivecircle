class CreateMedia < ActiveRecord::Migration
  def change
    create_table :media do |t|
      t.string :note
      t.string :photoUrl
      t.string :address
      t.float :latitude
      t.float :longitude
      t.timestamp :savedTime

      t.timestamps null: false
    end
  end
end
