class CreateMedia < ActiveRecord::Migration
  def change
    create_table :media, id: false do |t|
      t.primary_key :MediaId
      t.integer :UserId
      t.string :Note
      t.string :PhotoUrl
      t.string :Location
      t.timestamp :TimeSaved

      t.timestamps null: false
    end
  end
end
