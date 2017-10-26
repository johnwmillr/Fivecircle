class CreateMedia < ActiveRecord::Migration
  def change
    create_table :media do |t|
      t.string :Note
      t.string :PhotoUrl
      t.string :Location
      t.timestamp :SavedTime

      t.timestamps null: false
    end
  end
end
