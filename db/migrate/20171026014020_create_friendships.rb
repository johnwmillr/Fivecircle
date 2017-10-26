class CreateFriendships < ActiveRecord::Migration
  def change
    create_table :friendships do |t|
      t.boolean :Agreed

      t.timestamps null: false
    end
  end
end
